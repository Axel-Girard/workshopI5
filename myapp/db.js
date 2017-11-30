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
        if (err) {
          console.info('error connecting: ' + err.stack);
          return;
        }

        console.log('connected as id ' + connection.threadId);
        connection.query("SELECT * FROM compte", function (err, result, fields) {
          if (err) throw err;
          console.log(result);
        });
      });
    }

    return connection;
};
