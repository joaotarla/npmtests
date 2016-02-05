app = do require 'express'
routes = (require 'fs').readFile 'routes', 'utf8', (err, routesFile) =>
  for line in routesFile.split '\n' when line.match /^[A-Z]/
    route = line.split /\s+/
    path = route[2].split '.'
    app[do route[0].toLowerCase] route[1], (require "./#{path[0]}/#{path[1]}")[path[2]]
app.listen 3000
console.log "Server running at port 3000."
