var express = require('express');
var router = express.Router();
var db = require('../db.js');
var connection = new db();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

router.get('/autonomieSupervisee', function(req, res, next) {
  res.render('autonomieSupervisee');
});

router.get('/ajoutCompte', function(req, res, next) {
  res.render('ajoutCompte');
});

router.get('/creationRegle', function(req, res, next) {
  res.render('creationRegle');
});

router.get('/historiqueCompte', function(req, res, next) {
  res.render('historiqueCompte');
});

router.get('/ajoutCompte/:nom/:prenom/:numeroCompte', function(req, res, next) {
  var post  = { id: Math.random() * 10000, nom: req.params.nom, prenom: req.params.prenom, numero: req.params.numeroCompte };
  connection.query('INSERT INTO compte SET ?', post, function(err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });

  res.send(req.params);
});

module.exports = router;
