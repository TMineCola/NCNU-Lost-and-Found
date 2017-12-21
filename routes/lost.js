var express = require('express');
var router = express.Router();

/* ISO8601 處理格式 */
Date.prototype.toIsoString = function() {
  var tzo = -this.getTimezoneOffset(),
      dif = tzo >= 0 ? '+' : '-',
      pad = function(num) {
          var norm = Math.abs(Math.floor(num));
          return (norm < 10 ? '0' : '') + norm;
      };
  return this.getFullYear() +
      '-' + pad(this.getMonth() + 1) +
      '-' + pad(this.getDate()) +
      'T' + pad(this.getHours()) +
      ':' + pad(this.getMinutes()) +
      ':' + pad(this.getSeconds()) +
      dif + pad(tzo / 60) +
      ':' + pad(tzo % 60);
}

/* 檢測ID是否存在 */
function _CheckID(db, id) {
  let sql = "SELECT * FROM `property_lost` WHERE `ID` = ?";
  return new Promise((resolve, reject) => {
    db.query(sql, id, (err, result) => {
        if (err) {
          /* 查詢失敗時回傳訊息物件 */
          reject({"message": "查詢 ID:" + id + " 遺失物資訊失敗"});
        } else if(result.length == 0) {
          /* 查詢不到指定ID時回傳訊息物件 */
          reject({"message": "找不到指定遺失物 (ID:" + id + ")"});
        } else {
          resolve({"message": "Success"});
        }
    });
  });
}

/* 查詢全部文章 */
function _Search(db) {
  return new Promise((resolve, reject) => {
    let sql ="SELECT * FROM property_lost";
    db.query(sql, function (err, result, fields) {
      if(err) {
        /* 查詢失敗時回傳訊息物件 */
        reject({"message": "查詢全部遺失物資訊失敗"});
      } else {
        /* 新增成功時回傳文章物件 */
        resolve(result);
      }
    });
  });
}

/* 查詢指定ID文章 */
function _SearchID(db, id) {
  return new Promise((resolve, reject) => {
    let sql = "SELECT * FROM property_lost WHERE ID = ?";
    db.query(sql, id, function (err, result, fields) {
      if(err) {
        /* 查詢失敗時回傳訊息物件 */
        reject({"message": "查詢全部遺失物資訊失敗"});
      } else {
        /* 新增成功時回傳文章物件 */
        resolve(result);
      }
    });
  });
}

function _Post(db, values) {
  let sql = "INSERT INTO `property_lost` SET ?";
  return new Promise((resolve, reject) => {
    db.query(sql, values, function (err, result, fields) {
      if(err) {
        /* 新增失敗時回傳訊息物件 */
        reject({"message": "新增遺失物失敗"});
      } else {
        /* 新增成功時回傳訊息物件 */
        resolve({"message": "新增遺失物成功"});
      }
    });
  });
}

/* 更新指定ID文章 */
function _Update(db, values, id) {
  let sql = "UPDATE `property_lost` SET ? WHERE `ID` = ?";
  return new Promise((resolve, reject) => {
    db.query(sql, [values, id], function (err, result) {
      if(err) {
        /* 新增失敗時回傳訊息物件 */
        reject({"message": "遺失物更新失敗 (ID:" + id + ")"});
      } else {
        /* 新增成功時回傳訊息物件 */
        resolve({"message": "遺失物更新成功 (ID:" + id + ")"});
      }
    });
  });
}

/* 刪除指定ID文章 */
function _Delete(db, id) {
  let sql = "DELETE FROM `property_lost` WHERE `ID` = ?";
  return new Promise((resolve, reject) => {
    db.query(sql, id, function (err, result) {
      if(err) {
        /* 刪除失敗時回傳訊息物件 */
        reject({"message": "遺失物刪除失敗 (ID:" + id + ")"});
      } else {
        /* 刪除成功時回傳訊息物件 */
        resolve({"message": "遺失物刪除成功 (ID:" + id + ")"});
      }
    });
  });
}

/* 全部遺失物 */
router.get('/', function(req, res, next) {
  let db = req.dbstatus;
  _Search(db).then(postObj => {
    res.send(postObj);
    return;
  }).catch(errorObj => {
    res.send(errorObj);
    return;
  });
});

/* 以ID查詢遺失物 */
router.get('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lost_id = req.params.id;
  _SearchID(db, lost_id).then(postObj => {
    res.send(postObj);
    return;
  }).catch(errorObj => {
    res.send(errorObj);
    return;
  });
});

/* 新增遺失物 */
router.post('/', function(req, res, next) {
  let db = req.dbstatus;
  let nowTime = new Date().toIsoString();
  let lostObj = req.body;

  let values = {
    "name": lostObj.name,
    "classification_id": lostObj.classification_id,
    "location": lostObj.location,
    "registered_time": nowTime,
    "time_interval_LB": lostObj.time_interval_LB,
    "time_interval_UB": lostObj.time_interval_UB,
    "description": lostObj.description
  };

  /* 驗證修改資訊 */
  let LessObj = {
    "message": "資料不得為空 ("
  };
  let CheckNum = 0;
  for(index in values) {
    if(lostObj[index] == undefined && index != "description" && index != "registered_time") {
      LessObj.message += index + ",";
      CheckNum ++;
    }
  }
  if(CheckNum != 0) {
    LessObj.message = LessObj.message.slice(0, -1);
    LessObj.message += ")";
    res.send(LessObj);
    return;
  }

  _Post(db, values).then(successObj => {
    res.send(successObj);
    return;
  }).catch(errorObj => {
    res.send(errorObj);
    return;
  });
});

/* 修改遺失物資訊 */
router.patch('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lost_id = req.params.id;
  let lostObj = req.body;

  /* 檢驗ID是否存在 */
  _CheckID(db, lost_id).then(value => {
    let values = {
      "name": lostObj.name,
      "classification_id": lostObj.classification_id,
      "location": lostObj.location,
      "time_interval_LB": lostObj.time_interval_LB,
      "time_interval_UB": lostObj.time_interval_UB,
      "description": lostObj.description
    };
    /* 驗證修改資訊 */
    let LessObj = {
      "message": "資料不得為空 ("
    };
    let CheckNum = 0;
    for(index in values) {
      if(lostObj[index] == undefined && index != "description") {
        LessObj.message += index + ",";
        CheckNum ++;
      }
    }
    if(CheckNum != 0) {
      LessObj.message = LessObj.message.slice(0, -1);
      LessObj.message += ")";
      /* 如果缺少資料則將缺少欄位回傳並結束 */
      res.send(LessObj);
      return;
    }
    /* 執行更新 */
    return _Update(db, values, lost_id);
  }).then(successObj => {
    res.send(successObj);
    return;
  }).catch(errorObj => {
    res.send(errorObj);
  });

});

/* 刪除遺失物 */
router.delete('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lost_id = req.params.id;
  /* 檢驗ID是否存在 */
  _CheckID(db, lost_id).then(value => {
    return _Delete(db, lost_id);
  }).then(successObj =>{
    res.send(successObj);
    return;
  }).catch((errorObj) => {
    res.send(errorObj);
    return;
  });

});

module.exports = router;