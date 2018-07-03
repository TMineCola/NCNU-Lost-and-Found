var sha256 = require('sha256');
var express = require('express');
var router = express.Router();
var middleware = require('./middleware/login');
var db = require('./modules/accountController');

router.post('/', function(req, res, next) {
    let account = req.body;
    db.searchEmail(account.email).then(() => {
        return db.create(account.email, account.password);
    }).then((insertID) => {
        return res.status(200).send({ "insertID": insertID });
    }).catch(() => {
        return res.status(500).send({ "error": "insertError" });
    })
});

router.patch('/', function(req, res, next) {
    let account = req.body;
    db.searchEmail(account.email).then(() => {
        return db.modify(account.newemail, account.password, account.oldemail);
    }).then(() => {
        return res.status(200).send({ "success": "modifySuccess" });
    }).catch(() => {
        return res.status(500).send({ "error": "modifyError" });
    });
});

router.delete('/', function(req, res, next) {
    db.searchEmail(account.email).then(() => {
        return db.modify(account.email, account.password);
    }).then(() => {
        return res.status(200).send({ "success": "deleteSuccess" });
    }).catch(() => {
        return res.status(500).send({ "error": "deleteError" });
    });
});

module.exports = router;