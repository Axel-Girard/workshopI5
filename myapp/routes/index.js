var express = require('express');
var router = express.Router();
var db = require('../db.js');
var connection = new db();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('autonomieSupervisee');
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

router.get('/listeRegles', function(req, res, next) {
  res.render('listeRegles');
});

router.get('/ajoutCompte/:nom/:prenom/:numeroCompte', function(req, res, next) {
  var post  = { nom: req.params.nom, prenom: req.params.prenom, numero: req.params.numeroCompte };
  connection.query('INSERT INTO compte SET ?', post, function(err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });

  res.redirect('/historiqueCompte');
});


module.exports = router;
