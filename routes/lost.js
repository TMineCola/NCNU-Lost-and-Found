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

/* 檢查Json */
function isEmpty(obj) {
  for(var prop in obj) {
    if(obj.hasOwnProperty(prop))
      return false;
  }
  return true;
}


/* 檢查ID */
function CheckExist(id) {
  let db = req.dbstatus;
  db.query("SELECT * FROM `property_lost` WHERE `ID` = ?", id, function (err, result, fields) {
    if(err) {
      /* 查詢失敗時顯示訊息 */
      return 0;
    } else if(result.length > 0) {
      return 1;
    } else {
      /* 查無遺失物資訊時顯示訊息 */
      return 0;
    }
  });
}

/* 全部遺失物 */
router.get('/', function(req, res, next) {
  let db = req.dbstatus;
  /* 查詢失敗時顯示訊息 */
  let errorObj = {
    "message": "查詢全部遺失物資訊失敗"
  };
  db.query("SELECT * FROM property_lost", function (err, result, fields) {
    if(err) {
      throw err;
      res.send(errorObj);
    } else {
      res.send(result);
    }
  });
});

/* 以ID查詢遺失物 */
router.get('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lost_id = req.params.id;
  db.query("SELECT * FROM `property_lost` WHERE `ID` = ?", lost_id, function (err, result, fields) {
    if(err) {
      /* 查詢失敗時顯示訊息 */
      let errorObj = {
        "message": "查詢 ID:" + lost_id + " 遺失物資訊失敗"
      };
      res.send(errorObj);
      console.error(err);
    } else if(result.length > 0) {
      res.send(result);
    } else {
      /* 查無遺失物資訊時顯示訊息 */
      let errorObj = {
        "message": "找不該遺失物資訊 (ID:"+ lost_id +")"
      };
      res.send(errorObj);
    }
  });
});

/* 新增遺失物 */
router.post('/', function(req, res, next) {
  let db = req.dbstatus;
  let nowTime = new Date().toIsoString();
  let lostObj = req.body;
  let sql = "INSERT INTO `property_lost` SET ?";
  let values = {
    "name": lostObj.name,
    "classification_id": lostObj.classification_id,
    "location": lostObj.location,
    "registered_time": nowTime,
    "time_interval_LB": lostObj.time_interval_LB,
    "time_interval_UB": lostObj.time_interval_UB,
    "description": lostObj.description
  };
  db.query(sql, values, function (err, result, fields) {
    if(err) {
      /* 新增失敗時顯示訊息 */
      let errorObj = {
        "message": "新增遺失物失敗"
      };
      res.send(errorObj);
    } else {
      /* 新增成功時顯示訊息 */
      let successObj = {
        "message": "新增遺失物成功"
      };
      res.send(successObj);
    }
  });
});

/* 修改遺失物資訊 */
router.patch('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lost_id = req.params.id;
  let lostObj = req.body;
  let sql = "UPDATE `property_lost` SET ? WHERE `ID` = ?";
  let values = {
    "name": lostObj.name,
    "classification_id": lostObj.classification_id,
    "location": lostObj.location,
    "time_interval_LB": lostObj.time_interval_LB,
    "time_interval_UB": lostObj.time_interval_UB,
    "description": lostObj.description
  };
  db.query(sql, [values, lost_id], function (err, result, fields) {
    if(err) {
      /* 新增失敗時顯示訊息 */
      let errorObj = {
        "message": "遺失物更新失敗 (ID:" + lost_id + ")"
      };
      res.send(errorObj);
    } else {
      /* 新增成功時顯示訊息 */
      let successObj = {
        "message": "遺失物更新成功 (ID:" + lost_id + ")"
      };
      res.send(successObj);
    }
  });
});

/* 刪除遺失物 */
router.delete('/:id', function(req, res, next) {
  let db = req.dbstatus;
  let lost_id = req.params.id;
  let sql = "DELETE FROM `property_lost` WHERE `ID` = ?";
  db.query(sql, lost_id, function (err, result, fields) {
    if(err) {
      /* 刪除失敗時顯示訊息 */
      let errorObj = {
        "message": "遺失物刪除失敗 (ID:" + lost_id + ")"
      };
      res.send(errorObj);
    } else {
      /* 刪除成功時顯示訊息 */
      let successObj = {
        "message": "遺失物刪除成功 (ID:" + lost_id + ")"
      };
      res.send(successObj);
    }
  });
});

module.exports = router;
