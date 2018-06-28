var express = require('express');
var router = express.Router();
var config = require('../config/env');
var moment = require('moment');

/* Function */

  /* 檢測ID是否存在 */
  function _CheckID(db, id) {
    let sql = "SELECT * FROM `property_lostwish` WHERE `ID` = ?";
    return new Promise((resolve, reject) => {
      db.query(sql, id, function (err, result) {
          if (err) {
            /* 查詢失敗時回傳訊息物件 */
            reject(config.development === true ? {"message": "查詢 ID:" + id + " 遺失物資訊失敗", err} : {"message": "查詢 ID:" + id + " 遺失物資訊失敗"});
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
          reject(config.development === true ? {"message": "查詢全部遺失物資訊失敗", err} : {"message": "查詢全部遺失物資訊失敗"});
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
          reject(config.development === true ? {"message": "查詢全部遺失物資訊失敗", err} : {"message": "查詢全部遺失物資訊失敗"});
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

  /* 查詢指定建立者遺失物 */
  function _SearchAuthor(db, author) {
    return new Promise((resolve, reject) => {
      let sql = "SELECT `ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image` FROM `property_lostwish` WHERE `wisher_id` = ? order by time_interval_LB DESC";
      db.query(sql, author, function (err, result, fields) {
        if(err) {
          /* 查詢失敗時回傳訊息物件 */
          reject(config.development === true ? {"message": "查詢全部遺失物資訊失敗", err} : {"message": "查詢全部遺失物資訊失敗"});
        } else if(result.length == 0) {
          /* 查詢不到指定ID時回傳訊息物件 */
          reject({"message": "找不到指定建立者遺失物 (Author:" + author + ")"});
        } else {
          /* 新增成功時回傳遺失物物件 */
          resolve(result);
        }
      });
    });
  }

  /* 查詢指定state遺失物 */
  function _SearchState(db, state) {
    return new Promise((resolve, reject) => {
      let sql = "SELECT `ID`, `name`, `classification_id`, `location`, `registered_time`, `time_interval_LB`, `time_interval_UB`, `wisher_id`, `description`, `state`, `image` FROM `property_lostwish` WHERE `state` = ? order by time_interval_LB DESC";
      db.query(sql, state, function (err, result, fields) {
        if(err) {
          /* 查詢失敗時回傳訊息物件 */
          reject(config.development === true ? {"message": "查詢全部遺失物資訊失敗", err} : {"message": "查詢全部遺失物資訊失敗"});
        } else if(result.length == 0) {
          /* 查詢不到指定ID時回傳訊息物件 */
          reject({"message": "找不到指定狀態遺失物 (狀態:" + state + ")"});
        } else {
          /* 新增成功時回傳拾獲物物件 */
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
          reject(config.development === true ? {"message": "新增遺失物失敗", err} : {"message": "新增遺失物失敗"});
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
          reject(config.development === true ? {"message": "遺失物更新失敗 (ID:" + id + ")", err} : {"message": "遺失物更新失敗 (ID:" + id + ")"});
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
          reject(config.development === true ? {"message": "遺失物刪除失敗 (ID:" + id + ")", err} : {"message": "遺失物刪除失敗 (ID:" + id + ")"});
        } else {
          /* 刪除成功時回傳訊息物件 */
          resolve({"message": "遺失物刪除成功 (ID:" + id + ")"});
        }
      });
    });
  }

/* Router */

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
  router.get('/:id', function(req, res, next) {
    if(req.params.id == "state") {
      res.status(404).send({"message": "未指定查詢狀態"});
      return;
    } else if(req.params.id == "author") {
      res.status(404).send({"message": "未指定查詢建立者"});
      return;
    }
    let db = req.dbstatus;
    let id = req.params.id;
    _SearchID(db, id).then(lostwishObj => {
      res.send(lostwishObj);
      return;
    }).catch(errorObj => {
      res.status(404).send(errorObj);
      return;
    });
  });

  /* 以建立者查詢遺失物 */
  router.get('/author/:author', function(req, res, next) {
    let db = req.dbstatus;
    let author = req.params.author;
    _SearchAuthor(db, author).then(lostwishObj => {
      res.send(lostwishObj);
      return;
    }).catch(errorObj => {
      res.status(404).send(errorObj);
      return;
    });
  });

  /* 以狀態查詢遺失物 */
  router.get('/state/:state', function(req, res, next) {
    let db = req.dbstatus;
    let state = req.params.state;
    _SearchState(db, state).then(lostwishObj => {
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
    let lostwishObj = req.body;

    let time_LB = lostwishObj.time_interval_LB;
    let time_UB = lostwishObj.time_interval_UB;
    /* 處理時間上下限相反的情況 */
    if(time_LB > time_UB) {
      let temp = time_LB;
      time_LB = time_UB;
      time_UB = temp;
    }

    let values = {
      "name": lostwishObj.name,
      "classification_id": lostwishObj.classification_id,
      "location": lostwishObj.location,
      "registered_time": moment().toISOString(true),
      "wisher_id": req.user.id,
      "time_interval_LB": time_LB,
      "time_interval_UB": time_UB,
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
    for(index in values) {
      if((values[index] == undefined || values[index] == '') && index != "description" && index != "registered_time") {
        LessObj.message += index + ",";
        CheckNum ++;
      } else if(index == "time_interval_LB" || index == "time_interval_UB"){
        // 判斷時間是否符合 ISO8601格式
        if(!moment(values[index], moment.ISO_8601, true).isValid()) {
          LessObj.message += index + "(時間格式不符),";
          CheckNum ++;
        }
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
      if(time_LB > time_UB) {
        let temp = time_LB;
        time_LB = time_UB;
        time_UB = temp;
      }

      let values = {
        "name": lostwishObj.name,
        "classification_id": lostwishObj.classification_id,
        "location": lostwishObj.location,
        "time_interval_LB": time_LB,
        "time_interval_UB": time_UB,
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
        } else if(index == "time_interval_LB" || index == "time_interval_UB"){
          // 判斷時間是否符合 ISO8601格式
          if(!moment(values[index], moment.ISO_8601, true).isValid()) {
            LessObj.message += index + "(時間格式不符),";
            CheckNum ++;
          }
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
      return;
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