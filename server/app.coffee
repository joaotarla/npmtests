express = require 'express'
app = express()

app.set 'view engine', 'jade'

app.get '/healthCheck', (err, res) ->
  res.render 'healthCheck'

app.listen 8080

module.exports = app

