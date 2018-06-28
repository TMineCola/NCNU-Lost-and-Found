/* 連接MySQL */
var config = require('../../config/env');
var moment = require('moment');
var mysql = require('mysql');

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

    module.create = function (email, password) {
        return new Promise((resolve, reject) => {
            let sql = "INSERT INTO `register` (email, password, registered_time, isManager) VALUES (?, ?, ?, 0)";
            db.query(sql, [email, sha256(password), moment().toISOString(true)], function (err, result) {
                if (err) throw err;
                console.log(result);
            });
        });
    }

    module.modify = function (id, email, password) {
        return new Promise((resolve, reject) => {
            let sql = "UPDATE `register` SET `email` = ?, `password` = ? WHERE `ID` = ?";
            db.query(sql, [email, sha256(password), id], function (err, result) {
                if (err) throw err;
                console.log(result);
            });
        });
    }

    return module;
}();