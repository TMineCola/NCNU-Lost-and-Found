var express = require('express');
var router = express.Router();
var config = require('../config/env');

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
  let sql = "SELECT * FROM `property_lostwish` WHERE `ID` = ?";
  return new Promise((resolve, reject) => {
    db.query(sql, id, function (err, result) {
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

/* 查詢全部遺失物 */
function _Search(db) {
  return new Promise((resolve, reject) => {
    // 預設由新至舊
    let sql ="SELECT `ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image` FROM `property_lostwish` order by time_interval_LB DESC";
    db.query(sql, function (err, result, fields) {
      if(err) {
        /* 查詢失敗時回傳訊息物件 */
        console.log(err);
        reject({"message": "查詢全部遺失物資訊失敗"});
      } else {
        /* 新增成功時回傳遺失物物件 */
        resolve(result);
      }
    });
  });
}

/* 查詢指定ID遺失物 */
function _SearchID(db, id) {
  return new Promise((resolve, reject) => {
    let sql = "SELECT `ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image` FROM `property_lostwish` WHERE ID = ?";
    db.query(sql, id, function (err, result, fields) {
      if(err) {
        /* 查詢失敗時回傳訊息物件 */
        reject({"message": "查詢全部遺失物資訊失敗"});
      } else if(result.length == 0) {
        /* 查詢不到指定ID時回傳訊息物件 */
        reject({"message": "找不到指定遺失物 (ID:" + id + ")"});
      } else {
        /* 新增成功時回傳遺失物物件 */
        resolve(result);
      }
    });
  });
}

/* 新增遺失物 */
function _Post(db, values) {
  let sql = "INSERT INTO `property_lostwish` SET ?";
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

/* 更新指定ID遺失物 */
function _Update(db, values, id) {
  let sql = "UPDATE `property_lostwish` SET ? WHERE `ID` = ?";
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

/* 刪除指定ID遺失物 */
function _Delete(db, id) {
  let sql = "DELETE FROM `property_lostwish` WHERE `ID` = ?";
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
  _Search(db).then(lostwishObj => {
    res.send(lostwishObj);
    return;
  }).catch(errorObj => {
    res.status(404).send(errorObj);
    return;
  });
});

/* 以ID查詢遺失物 */
router.get('/id/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lostwish_id = req.params.id;
  _SearchID(db, lostwish_id).then(lostwishObj => {
    res.send(lostwishObj);
    return;
  }).catch(errorObj => {
    res.status(404).send(errorObj);
    return;
  });
});

/* 新增遺失物 */
router.post('/', function(req, res, next) {
  let db = req.dbstatus;
  let nowTime = new Date().toIsoString();
  let lostwishObj = req.body;

  var time_LB = lostwishObj.time_interval_LB;
  var time_UB = lostwishObj.time_interval_UB;
  /* 處理時間上下限相反的情況 */
  if(Date.parse(time_LB) > Date.parse(time_UB)) {
    let temp = time_LB;
    time_LB = time_UB;
    time_UB = temp;
  }

  let values = {
    "name": lostwishObj.name,
    "classification_id": lostwishObj.classification_id,
    "location": lostwishObj.location,
    "registered_time": nowTime,
    "time_interval_LB": lostwishObj.time_interval_LB,
    "time_interval_UB": lostwishObj.time_interval_UB,
    "description": lostwishObj.description
  };
  // 如果有圖片上傳, 則攜帶image及deleteHash資料
  if(lostwishObj['image'] != undefined && lostwishObj['image'] != '') {
    values['image'] = lostwishObj.image;
    values['deleteHash'] = lostwishObj.deleteHash;
  } else {
    values['image'] = "http://" + config.HOST_IP + "/img/null.jpg";
  }

  /* 驗證修改資訊 */
  let LessObj = {
    "message": "資料不得為空或缺少資料 ("
  };
  let CheckNum = 0;
  console.log(lostwishObj);
  for(index in values) {
    if((values[index] == undefined || values[index] == '') && index != "description" && index != "registered_time") {
      LessObj.message += index + ",";
      CheckNum ++;
    }
  }
  if(CheckNum != 0) {
    LessObj.message = LessObj.message.slice(0, -1);
    LessObj.message += ")";
    res.status(404).send(LessObj);
    return;
  }

  _Post(db, values).then(successObj => {
    res.send(successObj);
    return;
  }).catch(errorObj => {
    res.status(404).send(errorObj);
    return;
  });
});

/* 修改遺失物資訊 */
router.patch('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lostwish_id = req.params.id;
  let lostwishObj = req.body;

  /* 檢驗ID是否存在 */
  _CheckID(db, lostwish_id).then(value => {
    var time_LB = lostwishObj.time_interval_LB;
    var time_UB = lostwishObj.time_interval_UB;
    /* 處理時間上下限相反的情況 */
    if(Date.parse(time_LB) > Date.parse(time_UB)) {
      let temp = time_LB;
      time_LB = time_UB;
      time_UB = temp;
    }
    let values = {
      "name": lostwishObj.name,
      "classification_id": lostwishObj.classification_id,
      "location": lostwishObj.location,
      "time_interval_LB": lostwishObj.time_interval_LB,
      "time_interval_UB": lostwishObj.time_interval_UB,
      "description": lostwishObj.description
    };
    // 如果有圖片上傳或修改, 則攜帶image及deleteHash資料
    if(lostwishObj['image'] != undefined && lostwishObj['image'] != '') {
      values['image'] = lostwishObj.image;
      values['deleteHash'] = lostwishObj.deleteHash;
    }
    /* 驗證修改資訊 */
    let LessObj = {
      "message": "資料不得為空或缺少資料 ("
    };
    let CheckNum = 0;
    for(index in values) {
      if(lostwishObj[index] == undefined && index != "description") {
        LessObj.message += index + ",";
        CheckNum ++;
      }
    }
    if(CheckNum != 0) {
      LessObj.message = LessObj.message.slice(0, -1);
      LessObj.message += ")";
      /* 如果缺少資料則將缺少欄位回傳並結束 */
      res.status(404).send(LessObj);
      return;
    }
    /* 執行更新 */
    return _Update(db, values, lostwish_id);
  }).then(successObj => {
    res.send(successObj);
    return;
  }).catch(errorObj => {
    res.status(404).send(errorObj);
  });
});

/* 刪除遺失物 */
router.delete('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lostwish_id = req.params.id;
  /* 檢驗ID是否存在 */
  _CheckID(db, lostwish_id).then(value => {
    return _Delete(db, lostwish_id);
  }).then(successObj =>{
    res.send(successObj);
    return;
  }).catch((errorObj) => {
    res.status(404).send(errorObj);
    return;
  });

});

module.exports = router;