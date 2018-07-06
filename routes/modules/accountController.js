/* 連接MySQL */
var config = require('../../config/env');
var moment = require('moment');
var mysql = require('mysql');
var sha256 = require('sha256');

module.exports = function () {

    var db = mysql.createConnection({
        host: config.SQL_HOST,
        user: config.SQL_USER,
        password: config.SQL_PWD,
        database: config.SQL_DB
    });

    db.connect(function(err) {
        if(err) {
            console.log('MySQL連線失敗');
            console.error(err);
            return;
        }
        console.log('MySQL連線成功');
    });

    var module = {};

    module.searchAccount = function (email) {
        return new Promise((resolve, reject) => {
            let sql = "SELECT COUNT(*) FROM `register` WHERE `email` = ?";
            db.query(sql, email, function (err, result) {
                if (err) {
                    reject(err);
                    throw err;
                }
                if(result[0]['COUNT(*)'] == 1) {
                    resolve(true);
                } else {
                    resolve(false);
                }
            });
        });
    }

    module.verifyAccount = function (email, password) {
        return new Promise((resolve, reject) => {
            let sql = "SELECT `password` FROM `register` WHERE `email` = ?";
            db.query(sql, email, function (err, result) {
                if (err) throw err;
                if(result[0]['password'] == sha256(password)) {
                    resolve(true);
                } else {
                    reject(false);
                }
            });
        });
    }

    module.create = function (email, password) {
        return new Promise((resolve, reject) => {
            let sql = "INSERT INTO `register` (email, password, registered_time, isManager) VALUES (?, ?, ?, 0)";
            db.query(sql, [email, sha256(password), moment().toISOString(true)], function (err, result) {
                if (err) throw err;
                if(result['affectedRows'] == 1) {
                    resolve(result['insertId']);
                } else {
                    reject(false);
                }
            });
        });
    }

    module.modify = function (oldemail, newemail, password) {
        return new Promise((resolve, reject) => {
            let sql = "UPDATE `register` SET `email` = ?, `password` = ? WHERE `email` = ?";
            db.query(sql, [newemail, sha256(password), oldemail], function (err, result) {
                if (err) throw err;
                if(result['affectedRows'] == 1) {
                    resolve(true);
                } else {
                    reject(false);
                }
            });
        });
    }

    module.delete = function (email, password) {
        return new Promise((resolve, reject) => {
            let sql = "DELETE FROM `register` WHERE `email` = ? AND `password` = ?";
            db.query(sql, [email, sha256(password)], function (err, result) {
                if (err) throw err;
                console.log(result);
                if(result['affectedRows'] == 1) {
                    resolve(true);
                } else {
                    reject(false);
                }
            });
        });
    }

    return module;
}();