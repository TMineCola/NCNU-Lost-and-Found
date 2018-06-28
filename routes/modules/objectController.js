/* 連接MySQL */
var config = require('../../config/env');
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

    module.searchKey = function (table, key) {
        return new Promise((resolve, reject) => {
            let sql = "SELECT COUNT(*) FROM ?? WHERE `ID` = ?";
            db.query(sql, [table, key], function (err, result) {
                if (err) throw err;
                if(result[0]['COUNT(*)'] == 1) {
                    resolve(true);
                } else {
                    reject(false);
                }
            });
        });
    }

    module.changeState = function (table, key, state) {
        return new Promise((resolve, reject) => {
            let sql = "UPDATE ?? SET `state` = ? WHERE `ID` = ?";
            db.query(sql, [table, state, key], function (err, result) {
                if (err) throw err;
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