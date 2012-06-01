_plot = require '../lib/plot.js'

class @Map
  constructor: (@width, @height, @plot_string) -> 
    if @plot_string
      @plots = (new _plot.Plot(plot) for plot in @plot_string)
  
  plot: (x,y) ->
    if y?
      @plots[x*@width+(y)] if @plots?
    else
      @plots[x]

  render: ->
    s = "<div class=\"map\">"
    s+= plot.render() for plot in @plots 
    s+= "</div>"
