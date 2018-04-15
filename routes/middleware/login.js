/* private function */

function _foundFindOwner(db, id) {
    let sql = "SELECT `state`, `registrant_id` FROM `property_found` WHERE `ID` = ?";
    return new Promise((resolve, reject) => {
      db.query(sql, id, function(err, result) {
          if (err) {
            /* 查詢失敗時回傳訊息物件 */
            reject(config.development === true ? {"message": "查詢 ID: " + id + " 拾獲物建立者失敗", err} : {"message": "查詢 ID:" + id + " 拾獲物建立者失敗"});
          } else if(result.length == 0) {
            /* 查詢不到指定ID時回傳訊息物件 */
            reject(false);
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
            reject(config.development === true ? {"message": "查詢 ID: " + id + " 遺失物建立者失敗", err} : {"message": "查詢 ID:" + id + " 遺失建立者失敗"});
          } else if(result.length == 0) {
            /* 查詢不到指定ID時回傳訊息物件 */
            reject(false);
          } else {
            resolve(result);
          }
      });
    });
}

function _findAdmin(db, email) {
    let sql = "SELECT `isManager`, `department` FROM `register` WHERE `email` = ?";
    return new Promise((resolve, reject) => {
      db.query(sql, id, function(err, result) {
          if (err) {
            /* 查詢失敗時回傳訊息物件 */
            reject(config.development === true ? {"message": "查詢 email: " + email + " 管理者者失敗", err} : {"message": "查詢 email:" + email + " 管理者失敗"});
          } else if(result.length == 0) {
            /* 查詢不到指定ID時回傳訊息物件 */
            reject({"message": "非管理員身份"});
          } else {
            resolve(result);
          }
      });
    });
}

/* Export */

function isLoggedIn(req, res, next) {
    if(req.isAuthenticated()) {
        return next();
    }
    res.status(401).send({"message": "尚未登入"});
    return;
}

function isOwner(req, res, next) {
    let db = req.dbstatus;
    if(req.body.id == undefined) {
        res.status(404).send({"message": "缺少物件ID"});
        return;
    } else if(req.body.userid == undefined) {
        res.status(404).send({"message": "缺少使用者ID"});
        return;
    }
    if(req.originalUrl.indexOf("found") != -1) {
        // 以拾獲物路由進入, 找建立者
        _foundFindOwner(db, req.body.id).then(successObj => {
            if(successObj.state != 0) {
                // 若狀態已交由行政單位則無法由建立者移除
                res.status(403).send({"message": "已交由行政單位管理"});
                return;
            } else if(successObj.registrant_id == req.body.userid) {
                // 比對建立者
                next();
            } else {
                // 非建立者
                res.status(403).send({"message": "非物件建立者"});
                return;
            }
        }).catch(errorObj => {
            res.status(403).send({"message": "找不到物件"});
            return;
        });
    } else if(req.originalUrl.indexOf("lost") != -1) {
        // 以遺失物路由進入, 找建立者
        _lostFindOwner(db, req.body.id).then(successObj => {
            if(successObj.wisher_id == req.body.userid) {
                // 比對建立者
                next();
            } else {
                // 非建立者
                res.status(403).send({"message": "非物件建立者"});
                return;
            }
        }).catch(errorObj => {
            res.status(403).send({"message": "找不到物件"});
            return;
        });
    } else {
        res.status(404).send({"message": "路由錯誤"});
        return;
    }
    next();
}

function isAdmin(req, res, next) {
    let db = req.dbstatus;
    if(req.body.id == undefined) {
        res.status(404).send({"message": "缺少物件ID"});
        return;
    }
    _findAdmin(db, req.user.email).then(successObj=> {
        req.department = successObj.department;
        if(successObj.isManager == 1) {
            req.admin = true;
        } else {
            req.admin = false;
        }
        next();
    }).catch(errorObj => {
        res.status(404).send(errorObj);
        return;
    });
}

module.exports = {
    isLoggedIn,
    isOwner,
    isAdmin
};