var bodyParser = require('body-parser');
module.exports = function(app, dirRoutes) {
  var bodyEncoder = bodyParser.urlencoded({ extended: false });
  var start = +new Date();
  if(dirRoutes===undefined) {dirRoutes = './routes'}
  var controller, fs, method, rest, route, routes, url, _k, _len3, _ref3;
  fs = require('fs');
  // carrega as rotas
  routes = fs.readFileSync(dirRoutes, 'utf8');
  _ref3 = routes.split('\n');
  for (_k = 0, _len3 = _ref3.length; _k < _len3; _k++) {
    route = _ref3[_k];
    if (route.match(/^[A-Z]/)) {
      route = route.split(/\s+/);
      rest = route[0].toLowerCase();
      url = route[1];
      method = route[2];
      var m = method.split('.');
      try {
          method = require('./'+m[0]+'/'+m[1])[m[2]];
      } catch (e) {
        throw new Error("Method '" + route[2] + "' doesn't exists");
      }
      if (rest !== 'get' && rest !== 'post' && rest !== 'put' && rest !== 'delete' && rest !== 'head' && rest !== 'all') {
        throw new Error("REST method '" + rest + "' not supported");
      }
      if (!/^\/\w*/.test(url)) {
        throw new Error("Invalid URL '" + url + "' in routes");
      }
      app[rest](url, bodyEncoder, (function(controller, method) {
        return function(req, res) {
          return method(req, res);
        };
      })(controller, method));
    }
  }
  console.log('Routes loaded in: '+(+new Date() - start)+'ms');
};
