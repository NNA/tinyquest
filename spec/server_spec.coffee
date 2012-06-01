require 'mocha'
should    = require 'should'
request   = require 'request'
sinon     = require 'sinon'
_server   = require '../lib/server.js'
fs        = require 'fs'

http      = require 'http'

describe 'Server', ->
  subject = new _server.Server

  describe '#startHTTP', ->
    it 'respond 200 to http requests on given port number', (done) ->
      subject.startHTTP 5001, ->
        request 'http://localhost:5001', (err, res, body) ->
          should.not.exist(err)
          res.statusCode.should.equal 200
          done()
    
    it 'with env var PORT existing, should start http server on this port', (done) ->
      @sandbox = sinon.sandbox.create()
      @sandbox.stub(process, 'env', {PORT: 5002})
      
      subject.startHTTP null, =>
        request 'http://localhost:5002', (err, res, body) =>
          should.not.exist(err)
          @sandbox.restore()
          done()

    it 'without env var PORT existing and port given, should start http server 5000 by default', (done) ->
      subject.startHTTP null, ->
        request 'http://localhost:5000', (err, res, body) ->
          should.not.exist(err)
          done()

    it 'should serve index.html by default', (done) ->
      @sandbox.stub(fs, 'readFile').yields(null, "content of file index.html")
      subject.startHTTP null, =>
        request 'http://localhost:5000', (err, res, body) =>
          should.not.exist(err)
          body.should.equal "content of file index.html"
          @sandbox.restore()
          done()

  afterEach ->
    subject.stop()
