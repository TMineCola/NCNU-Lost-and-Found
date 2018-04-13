function _foundFindOwner(db, id) {
    let sql = "SELECT `state`, `registrant_id` FROM `property_found` WHERE `ID` = ?";
    return new Promise((resolve, reject) => {
      db.query(sql, id, function(err, result) {
          if (err) {
            /* 查詢失敗時回傳訊息物件 */
            reject(config.development === true ? {"message": "查詢 ID: " + id + " 拾獲物資訊失敗", err} : {"message": "查詢 ID:" + id + " 拾獲物資訊失敗"});
          } else if(result.length == 0) {
            /* 查詢不到指定ID時回傳訊息物件 */
            reject(undefined);
          } else {
            resolve(result);
          }
      });
    });
}

function _lostFindOwner(db, id) {
    let sql = "SELECT `state`, `wisher_id` FROM `property_lostwish` WHERE `ID` = ?";
    return new Promise((resolve, reject) => {
      db.query(sql, id, function(err, result) {
          if (err) {
            /* 查詢失敗時回傳訊息物件 */
            reject(config.development === true ? {"message": "查詢 ID: " + id + " 遺失物資訊失敗", err} : {"message": "查詢 ID:" + id + " 拾獲物資訊失敗"});
          } else if(result.length == 0) {
            /* 查詢不到指定ID時回傳訊息物件 */
            reject(undefined);
          } else {
            resolve(result);
          }
      });
    });
}

function isLoggedIn(req, res, next) {
    if(req.isAuthenticated()) {
        return next();
    }
    res.status(401).send({"message": "尚未登入"});
}

function isOwner(req, res, next) {
    let db = req.dbstatus;
    if(req.body.ID == undefined) {
        res.status(404).send({"message": "缺少物件ID"});
    }
    if(req.originalUrl.indexOf("found") != -1) {
        _foundFindOwner(db, req.body.ID).then(successObj => {
            if(successObj.state != 0) {
                res.status(403).send({"message": "以交由行政單位管理"});
            } else {
                next();
            }
        }).catch(errorObj => {
            res.status(403).send({"message": "非物件建立者"});
        });
    } else if(req.originalUrl.indexOf("lost") != -1) {
        _lostFindOwner(db, req.body.ID).then(successObj => {
            if(successObj.state != 0) {
                res.status(403).send({"message": "以交由行政單位管理"});
            } else {
                next();
            }
        }).catch(errorObj => {
            res.status(403).send({"message": "非物件建立者"});
        });
    } else {
        res.status(404).send({"message": "路由錯誤"});
    }
    next();
}

module.exports = {
    isLoggedIn,
    isOwner
};