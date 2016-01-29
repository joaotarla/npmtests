var chai     = require('chai');
var app      = require('../server/app');
var should   = chai.should();

chai.use(require('chai-http'));

describe('Router', function() {
  it('should correctly works on healhtCheck GET', function(done) {
      chai.request(app)
        .get('/healthCheck')
        .end(function(err, res){
          res.should.have.status(200);
          done();
        });
  });
});
