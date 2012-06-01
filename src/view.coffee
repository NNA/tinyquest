class @View
  constructor: (@map) -> 
  
  render: ->
    "<div class=\"view\">#{@map.render()}</div>"

