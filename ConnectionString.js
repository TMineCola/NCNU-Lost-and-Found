var mysql = require("mysql");

var pool = mysql.createPool({
        connectionLimit : 100,
        host     : '163.22.10.22',
        user     : 'lost',
        port     : '3306',
        password : 'l0st!@#$..',
        database : 'lost_found',
    });
// function keepAlive(){
//   pool.getConnection(function(err, connection){
//     if(err) { return; }
//     connection.ping();
//     connection.end();
//   });
// }
// setInterval(keepAlive, 30000);
exports.getConnection = function(callback) {
  pool.getConnection(function(err, conn) {
    console.log(err);
    if(err) {
      console.log('mysql error!');
      return callback(err);
    }
    callback(err, conn);
  });
};