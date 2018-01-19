var express = require('express');
var router = express.Router();

/* 查詢全部聯絡資訊 */
function _Search(db) {
  return new Promise((resolve, reject) => {
    // 預設由新至舊
    let sql ="SELECT `ID`, `name`, `contact_info`, `isManagement` FROM department ";
    db.query(sql, function (err, result, fields) {
      if(err) {
        /* 查詢失敗時回傳訊息物件 */
        reject({"message": "查詢全部聯絡資訊資訊失敗"});
      } else {
        /* 新增成功時回傳聯絡資訊物件 */
        resolve(result);
      }
    });
  });
}

/* 全部聯絡資訊 */
router.get('/', function(req, res, next) {
  let db = req.dbstatus;
  _Search(db).then(foundObj => {
    res.send(foundObj);
    return;
  }).catch(errorObj => {
    res.status(404).send(errorObj);
    return;
  });
});



module.exports = router;