var sha256 = require('sha256');
var express = require('express');
var router = express.Router();
var controller = require('./middleware/login');
var db = require('./modules/accountController');

router.post('/', function(req, res, next) {
    let account = req.body;
});

router.patch('/', function(req, res, next) {

});

router.delete('/', function(req, res, next) {

});

module.exports = router;