app = do require 'express'
routes = (require 'fs').readFileSync 'routes', 'utf8'
for route in routes.split '\n' when route.match /^[A-Z]/
  route = route.split /\s+/
  resource = route[2].split '.'
  className = "./#{resource[0]}/#{resource[1]}"
  app[do route[0].toLowerCase] route[1], (require className)[resource[2]]
app.listen 3000
console.log "Server running at port 3000."
