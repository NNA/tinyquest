class @Plot
  constructor: (@type) ->
   
  _htmlClass: ->
    switch @type
      when 'G' then 'grass'
      when 'W' then 'water'  
      else ''
   
  render: ->
    "<div class=\"#{@_htmlClass()}\"></div>"
