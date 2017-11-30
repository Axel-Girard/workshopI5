var express = require('express');
var router = express.Router();

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
  console.log(req.param.nom);
  res.render('index');
});

module.exports = router;
