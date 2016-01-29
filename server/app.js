var express = require('express');

var app = express();

app.get('/healthCheck', function(err, res){
  res.send('I\'m alive!');
});

app.listen(8080);

module.exports = app;
