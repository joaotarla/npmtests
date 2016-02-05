start  = new Date
app = do require 'express'
port = 8080

require('./router')(app, port, "#{__dirname}/controllers")

console.log "server bootstrap finished in #{new Date - start}\nRunning on port #{port}"
