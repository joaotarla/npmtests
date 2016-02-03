chai   = require('chai')
app    = require('../server/app')
should = chai.should()
chai.use require('chai-http')

describe 'Router', ->
  it 'should correctly works on healhtCheck GET', (done) ->
    chai.request(app).get('/healthCheck').end (err, res) ->
      res.should.have.status 200
      done()
