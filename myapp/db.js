// connection to the data base
var mysql      = require('mysql');
var connection = null

module.exports = function () {
    if(!connection) {
      connection = mysql.createConnection({
        host     : '192.168.1.10',
        user     : 'axel',
        password : 'axel',
        database : 'Workshop'
      });

      connection.connect(function(err) {
        if (err) throw err;
        console.log('connected as id ' + connection.threadId);
      });
    }

    return connection;
};
