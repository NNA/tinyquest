require 'mocha'
sinon = require 'sinon'
should = require 'should'
_plot = require '../lib/plot.js'

describe 'Plot', -> 
  subject = new _plot.Plot('G')
  it 'is initiated', ->
    subject.should.be.an.instanceof(_plot.Plot)
  it 'knows its type', ->
    subject.type.should.equal 'G'
  describe '#render()', ->
    it 'should return div with class from htmlClass()', ->
      sinon.sandbox.stub(subject, '_htmlClass').returns('grass')
      subject.render().should.equal('<div class="grass"></div>') 
