var LocalStrategy = require('passport-local').Strategy;
var FacebookStrategy = require('passport-facebook').Strategy;
var GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;
var accountControl = require('../routes/modules/accountController');

module.exports = function (passport, config, auth_config, con) {

    passport.serializeUser(function (user, done) {
        done(null, user);
    });

    passport.deserializeUser(function (user, done) {
        console.log(user);
        done(null, user);
    });

    // Local Login
    passport.use('local-signup', new LocalStrategy({
            usernameField : 'username',
            passwordField : 'password',
            passReqToCallback : true
        },
        function(req, username, password, done) {
            accountControl.searchAccount(username).then((bool) => {
                if(bool) {
                    console.log('存在');
                    return done(null, false, req.flash('error', '該帳號已存在'));
                } else {
                    console.log('不存在');
                    return accountControl.create(username, password).then((id) => {
                        let profile = {
                            'id': id,
                            'emails': [{'value': username}],
                            'photos': [{'value':'https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/user.png'}],
                            'displayName': username
                        }
                        console.log('新增');
                        return done(null, profile);
                    }).catch(()=> {
                        return done(null, false, req.flash('error', '帳號新增失敗'));
                    })
                }
            }).catch(() => {
                return done(null, false, req.flash('error', '伺服器錯誤'));
            });
        }
    ));

    // Local Login
    passport.use('local-login', new LocalStrategy({
            usernameField : 'username',
            passwordField : 'password',
            passReqToCallback : true
        },
        function(req, username, password, done) {
            accountControl.searchAccount(username).then((bool) => {
                if(bool) {
                    console.log('存在');
                    return accountControl.verifyAccount(username, password).then((id) => {
                        let profile = {
                            'id': id,
                            'emails': [{'value': username}],
                            'photos': [{'value':'https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/user.png'}],
                            'displayName': username
                        }
                        console.log('驗證成功');
                        return done(null, profile);
                    }).catch(()=> {
                        console.log('驗證失敗');
                        return done(null, false);
                    })
                } else {
                    console.log('不存在');
                    return done(null, false);
                }
            }).catch(() => {
                return done(null, false);
            });
        })
    );

    // Facebook Login
    passport.use('facebook', new FacebookStrategy({
        clientID: auth_config.facebookAuth.clientID,
        clientSecret: auth_config.facebookAuth.clientSecret,
        callbackURL: 'http://' + config.HOST_IP + '/login/facebook/return',
        profileFields: ['id', 'email', 'picture', 'displayName']
    },
    function (req, accessToken, refreshToken, profile, done) {
        console.log(profile);
        process.nextTick(function () {
            if(!req.user) {
                let sql = 'SELECT * FROM `user` WHERE id = ?';
                con.query(sql, profile.id, function (err, result) {
                    if (err) throw err;
                    if (result.length == 0) {
                        console.log('Could not find such user, then add');
                        let userObj = {
                            'id': profile.id,
                            'name': profile.displayName,
                        };
                        if (profile.emails != undefined) {
                            userObj['email'] = profile.emails[0].value;
                        }
                        sql = 'INSERT INTO `user` SET ?';
                        con.query(sql, userObj);
                    } else {
                        console.log('User already exists in database');
                    }
                });
                return done(null, profile);
            } else {
                return done(null, profile);
            }
        });
    }));

    // Google Login
    passport.use('google',new GoogleStrategy({
        clientID: auth_config.googleAuth.clientID,
        clientSecret: auth_config.googleAuth.clientSecret,
        callbackURL: 'http://' + config.HOST_IP + '/login/google/return',
        passReqToCallback: true
    },
    function (accessToken, refreshToken, profile, done) {
        process.nextTick(function () {
        });
    }));
}