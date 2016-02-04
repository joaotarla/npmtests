start   = new Date
express = require 'express'
app     = express()
fs      = require('fs')
#app.set 'view engine', 'jade'
require "#{__dirname}/controllers/#{controller}" for controller in fs.readdirSync 'controllers'

fs.readFile './routes', 'utf8', (err, data) ->
  for line in data.split '\n' when line.length > 0 and line[0] isnt '#'
    line = line.split /\s+/
    console.log line
    app[line[0].toLowerCase()] line[1],
#(err, res) => res.send "ta tranquilo, ta favoravel."
#app['get'] '/one', (err, res) -> res.send 'tudo ok'

console.log "routes loaded in #{new Date - start} ms"
module.exports = app.listen 8080
