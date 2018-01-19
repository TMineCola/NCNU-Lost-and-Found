var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');
var config = require('./config/env');
var auth_config = require('./config/auth_config');

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

/* 載入passport及facebook驗證 */
var passport = require('passport');
var FacebookStrategy = require('passport-facebook').Strategy;
var GoogleStrategy   = require('passport-google-oauth').OAuth2Strategy;

  passport.serializeUser(function(user, done) {
    done(null, user);
  });

  passport.deserializeUser(function(user, done) {
    done(null, user);
  });

  // Facebook Login
  passport.use(new FacebookStrategy({
    clientID: auth_config.facebookAuth.clientID,
    clientSecret: auth_config.facebookAuth.clientSecret,
    callbackURL: 'http://' + config.HOST_IP + '/login/facebook/return',
    profileFields	:['id', 'email', 'picture', 'displayName']
  },
  function(req, accessToken, refreshToken, profile, done) {
    process.nextTick(function() {
      if(!req.user) {
        let sql = "SELECT * FROM `user` WHERE id = ?";
        con.query(sql, profile.id, function(err, result) {
          if(err) throw err;
          if(result.length == 0) {
            console.log("Could not find such user, then add");
            let userObj = {
              "id": profile.id,
              "name": profile.displayName,
            };
            if(accessToken != undefined || accessToken != '') {
                userObj['access_token'] = accessToken;
            }
            if(profile.emails != undefined) {
              userObj['email'] = profile.emails[0].value;
            }
            sql = "INSERT INTO `user` SET ?";
            con.query(sql, userObj);
          } else {
            console.log("User already exists in database");
          }
        });
        return done(null, profile);
      } else {
        return done(null, profile);
      }
    });
  }));
  // Google Login
  passport.use(new GoogleStrategy({
    clientID        : auth_config.googleAuth.clientID,
    clientSecret    : auth_config.googleAuth.clientSecret,
    callbackURL     : 'http://' + config.HOST_IP + '/login/google/return',
    passReqToCallback : true
  }, function(accessToken, refreshToken, profile, done) {
      process.nextTick(function() {
      });
  }));

/* 預載路由處理方式 */
var lost = require('./routes/lost');
var found = require('./routes/found');
var contact = require('./routes/contact');

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
app.use(passport.initialize());
app.use(passport.session());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/vendor', express.static(__dirname + '/public/vendor'));

// 將資料庫連線狀態帶入
app.use(function(req, res, next) {
  req.dbstatus = con;
  next();
});

// 網頁路由
app.get('/', function(req, res) {
  res.render('pages/index', { user : req.user });
});
app.get('/found', function(req, res) {
  res.render('pages/found', { user : req.user });
});
app.get('/lost', function(req, res) {
  res.render('pages/lost', { user : req.user });
});
app.get('/expired', function(req, res) {
  res.render('pages/expired', { user : req.user });
});
app.get('/claim', function(req, res) {
  res.render('pages/claim', { user : req.user });
});
app.get('/contact', function(req, res) {
  res.render('pages/contact', { user : req.user });
});
app.get('/editor_found', function(req, res) {
    res.render('pages/editor_found', { user : req.user });
});
app.get('/wishlist_form', function(req, res) {
    res.render('pages/wishlist_form', { user : req.user });
});
app.get('/lost_form', function(req, res) {
    res.render('pages/lost_form', { user : req.user });
});

// 驗證路由

app.get('/login/facebook', passport.authenticate('facebook', { scope : ["email"] }));
app.get('/login/facebook/return', passport.authenticate('facebook', { failureRedirect: '/' }), function(req, res) {
  res.redirect('/');
});

app.get('/logout', function(req, res){
  req.logout();
  res.redirect('/');
});

// 檢驗是否登入 middle ware
function isLoggedIn(req, res, next) {
  if(req.isAuthenticated()) {
    return next();
  }
  res.render('尚未登入');
}

// API路由
app.use('/api/lost', lost);
app.use('/api/found', found);
app.use('/api/contact', contact);

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
