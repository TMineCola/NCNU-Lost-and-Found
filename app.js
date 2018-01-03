var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var config = require('./env')

/* 預載路由處理方式 */
var lost = require('./routes/lost');
var found = require('./routes/found');
var contact = require('./routes/contact');

/* 連接MySQL */
var mysql = require('mysql');

var con = mysql.createConnection({
  host: config.SQL_HOST,
  user: config.SQL_USER,
  password: config.SQL_PWD,
  database: config.SQL_DB
});

con.connect(function(err) {
  if(err) {
    console.log("MySQL連線失敗");
    console.error(err);
    return;
  }
  console.log("MySQL連線成功");
});

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
app.use(express.static(path.join(__dirname, 'public')));
app.use('/vendor', express.static(__dirname + '/public/vendor'));

// 將資料庫連線狀態帶入
app.use(function(req, res, next) {
  req.dbstatus = con;
  next();
});

app.use('/api/lost', lost);
app.use('/api/found', found);
app.use('/api/contact', contact);

// 自訂路徑
app.get('/', function(req, res) {
  res.render('pages/index');
});
app.get('/found', function(req, res) {
  res.render('pages/found');
});
app.get('/lost', function(req, res) {
  res.render('pages/lost');
});
app.get('/expired', function(req, res) {
  res.render('pages/expired');
});
app.get('/claim', function(req, res) {
  res.render('pages/claim');
});
app.get('/contact', function(req, res) {
  res.render('pages/contact');
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = config.development === true ? err : {"message": "Page not found"};

  // render the error page
  res.status(err.status || 500);
  res.json(res.locals.error);
});

module.exports = app;
