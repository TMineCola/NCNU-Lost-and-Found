var sha256 = require('sha256');
var express = require('express');
var router = express.Router();
var middleware = require('./middleware/login');
var db = require('./modules/accountController');

router.get('/', function(req, res, next) {
    let account = req.body;
    db.searchAccount(account.email).then((status) => {
        if(status) {
            res.status(403).send({ "error": "already enroll"});
            return;
        } else {
            res.status(200).send({ "success": "you can enroll" });
            return;
        }
    }).catch((err) => {
        res.status(500).send({ "error": err });
        return;
    });
});

router.post('/', function(req, res, next) {
    let account = req.body;
    db.searchAccount(account.email).then((status) => {
        if(status) {
            res.status(403).send({ "error": "already enroll"});
            return;
        } else {
            return db.create(account.email, account.password);
        }
    }).then(() => {
        return res.status(200).send({ "success": "insert success" });
    }).catch((err) => {
        return res.status(500).send({ "error": err });
    })
});

router.patch('/', function(req, res, next) {
    let account = req.body;
    db.searchAccount(account.email).then((status) => {
        if(status) {
            return db.verifyAccount(account.email, account.password);
        } else {
            res.status(403).sned({ "error": "not enroll"});
            return;
        }
    }).then(() => {
        return db.modify(account.newemail, account.password, account.email);
    }).then(() => {
        return res.status(200).send({ "success": "modifySuccess" });
    }).catch(() => {
        return res.status(500).send({ "error": "modifyError" });
    });
});

router.delete('/', function(req, res, next) {
    let account = req.body;
    db.searchAccount(account.email).then((status) => {
        if(status) {
            return db.verifyAccount(account.email, account.password);
        } else {
            res.status(403).sned({ "error": "not enroll"});
            return;
        }
    }).then(() => {
        return db.delete(account.email, account.password);
    }).then(() => {
        return res.status(200).send({ "success": "deleteSuccess" });
    }).catch(() => {
        return res.status(500).send({ "error": "deleteError" });
    });
});

module.exports = router;