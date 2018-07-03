var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');
var flash = require('connect-flash');
var config = require('./config/env');
var auth_config = require('./config/auth_config');
var mysql = require('mysql');
var middleware = require('./routes/middleware/login');

/* 連接MySQL */
var con = mysql.createConnection({
    host: config.SQL_HOST,
    user: config.SQL_USER,
    password: config.SQL_PWD,
    database: config.SQL_DB
});

con.connect(function (err) {
    if (err) {
        console.log("MySQL連線失敗");
        console.error(err);
        return;
    }
    console.log("MySQL連線成功");
});

/* 載入passport */
var passport = require('passport');
require('./config/passport')(passport, config, auth_config, con);

/* 預載路由處理方式 */
var lost = require('./routes/lost');
var found = require('./routes/found');
var contact = require('./routes/contact');
var admin = require('./routes/admin');
var account = require('./routes/account');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(session({
    secret: 'ilovencnulostandfound',
    resave: true,
    saveUninitialized: true
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/vendor', express.static(__dirname + '/public/vendor'));

// 將資料庫連線狀態帶入
app.use(function (req, res, next) {
    req.dbstatus = con;
    next();
});

// 網頁路由
app.get('/', function (req, res) {
    res.render('pages/index', { user: req.user, page_name: 'index' });
});
app.get('/found', function (req, res) {
    res.render('pages/found', { user: req.user, page_name: 'found' });
});
app.get('/lost', function (req, res) {
    res.render('pages/lost', { user: req.user, page_name: 'lost' });
});
app.get('/expired', function (req, res) {
    res.render('pages/expired', { user: req.user, page_name: 'expired' });
});
app.get('/claim', function (req, res) {
    res.render('pages/claim', { user: req.user, page_name: 'claim' });
});
app.get('/contact', function (req, res) {
    res.render('pages/contact', { user: req.user, page_name: 'contact' });
});
app.get('/editor_found', function (req, res) {
    res.render('pages/editor_found', { user: req.user, page_name: 'editor_found' });
});
app.get('/editor_lost', function (req, res) {
    res.render('pages/editor_lost', { user: req.user, page_name: 'editor_lost' });
});
app.get('/wishlist_form', function (req, res) {
    res.render('pages/wishlist_form', { user: req.user, page_name: 'wishlish_form' });
});
app.get('/lost_form', function (req, res) {
    res.render('pages/lost_form', { user: req.user, page_name: 'lost_form' });
});

app.post('/register/admin', passport.authenticate('local-signup', {
    successRedirect : '/', // redirect to the secure profile section
    failureRedirect : '/', // redirect back to the signup page if there is an error
    failureFlash : true // allow flash messages
}));

// 驗證路由

app.post('/login/admin', passport.authenticate('local-login', {
        successRedirect : '/',
        failureRedirect : '/',
        failureFlash : true }),function(req, res) {
    res.redirect(req.session.returnTo || '/');
    res.redirect('/');
});

app.get('/login/facebook', passport.authenticate('facebook', { scope: ["email"] }));
app.get('/login/facebook/return', passport.authenticate('facebook', { failureRedirect: '/' }), function (req, res) {
    res.redirect(req.session.returnTo || '/');
    delete req.session.returnTo;
});

app.get('/logout', function (req, res) {
    req.logout();
    res.redirect('/');
});

// API路由
app.use('/api/lost', lost);
app.use('/api/found', found);
app.use('/api/contact', contact);
app.use('/api/admin', admin);
app.use('/api/account', account);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = config.development === true ? err : { "message": "Page not found" };

    // render the error page
    res.status(err.status || 500);
    res.json(res.locals.error);
});

module.exports = app;
