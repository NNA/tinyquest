require 'mocha'
sinon = require 'sinon'
should = require 'should'
map = require '../lib/map.js'
_plot = require '../lib/plot.js'

describe 'Map', -> 
  describe 'with no params', ->
    subject = new map.Map
    it 'is initiated', ->
      subject.should.be.an.instanceof(map.Map)
    it 'has no plots', ->
      should.not.exist(subject.plot(1,1))

  describe 'with width, height and plots', ->
    subject = new map.Map(2,2,'ABGW')
    it 'knows the plot at given position', ->
      subject.plot(2).should.eql(new _plot.Plot('G'))
    it 'knows the plot at given coordinates', ->
      subject.plot(1,1).should.eql(new _plot.Plot('W'))
 
  describe '#render', ->
    it 'should render itself by asking each of its plots', ->
      m = new map.Map(1,2,'GW') 
      sinon.sandbox.stub(m.plot(0),'render').returns('<gp>')
      sinon.sandbox.stub(m.plot(1),'render').returns('<wp>')
      
      m.render().should.equal("<div class=\"map\"><gp><wp></div>")
