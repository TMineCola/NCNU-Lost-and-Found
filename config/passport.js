var LocalStrategy = require('passport-local').Strategy;
var FacebookStrategy = require('passport-facebook').Strategy;
var GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;

module.exports = function (passport, config, auth_config, con) {

    passport.serializeUser(function (user, done) {
        done(null, user);
    });

    passport.deserializeUser(function (user, done) {
        done(null, user);
    });

    // Local Login
    passport.use(new LocalStrategy({

    },
    function() {

    }));

    // Facebook Login
    passport.use(new FacebookStrategy({
        clientID: auth_config.facebookAuth.clientID,
        clientSecret: auth_config.facebookAuth.clientSecret,
        callbackURL: 'http://' + config.HOST_IP + '/login/facebook/return',
        profileFields: ['id', 'email', 'picture', 'displayName']
    },
    function (req, accessToken, refreshToken, profile, done) {
        process.nextTick(function () {
            if(!req.user) {
                let sql = "SELECT * FROM `user` WHERE id = ?";
                con.query(sql, profile.id, function (err, result) {
                    if (err) throw err;
                    if (result.length == 0) {
                        console.log("Could not find such user, then add");
                        let userObj = {
                            "id": profile.id,
                            "name": profile.displayName,
                        };
                        if (profile.emails != undefined) {
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