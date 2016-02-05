express      = require 'express'
fs = require 'fs'
app = express()

require "./controllers/#{controller}" for controller in fs.readdirSync "controllers"

routes = fs.readFileSync 'routes', 'utf8'
for route in routes.split('\n') when route.match /^[A-Z]/
  route      = route.split /\s+/
  rest       = route[0].toLowerCase()
  url        = route[1]
  method     = route[2]
  try
    console.log "route=#{route}"
    console.log "rest=#{rest}"
    console.log "url=#{url}"
    console.log "method=#{method}"
    method = eval[method]
  catch e
    throw new Error "Method '#{route[2]}' doesn't exists"
  throw new Error "REST method '#{rest}' not supported" if rest not in ['get', 'post', 'put', 'delete', 'head', 'all']
  throw new Error "Invalid URL '#{url}' in routes" unless /^\/\w*/.test url
  console.log "controller=#{controller}"
  app[rest] url, do (controller, method) -> (req, res) -> method req, res

#mongoose.connect 'mongodb://127.0.0.1:27017/test', (err) ->
#  if err then throw err

app.listen 3000
