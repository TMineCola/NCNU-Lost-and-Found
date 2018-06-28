var express = require('express');
var router = express.Router();
var controller = require('./middleware/login');
var db = require('./modules/objectController');

router.post('/changeState/found', function(req, res, next) {
    let object = req.body;
    let response = {
        failed: []
    };
    let runtime = [];

    object["ID"].forEach(ID => {
        runtime.push(db.changeState('property_found', ID, object.state).catch(() => {
            response.failed.push(ID);
        }));
    })

    Promise.all(runtime).then(() => res.status(200).send(response)).catch(error => res.status(500).send(error));
});

router.post('/changeState/lost', function(req, res, next) {
    let object = req.body;
    let response = {
        failed: []
    };
    let runtime = [];

    object["ID"].forEach(ID => {
        runtime.push(db.changeState('property_lostwish', ID, object.state).catch(() => {
            response.failed.push(ID);
        }));
    })

    Promise.all(runtime).then(() => res.status(200).send(response)).catch(error => res.status(500).send(error));
});

module.exports = router;