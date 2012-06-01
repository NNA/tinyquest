require 'mocha'
should = require 'should'
_map    = require '../lib/map.js'
_view   = require '../lib/view.js'
sinon  = require 'sinon'

describe 'View', ->
  describe '#render', ->
    map = new _map.Map()
    subject = new _view.View(map)

    #it 'renders its map as html', ->
    #  sinon.sandbox.stub(map, 'render').returns('rendered_map')
    #  subject.render().should.equal '<div class="view">rendered_map</div>'
