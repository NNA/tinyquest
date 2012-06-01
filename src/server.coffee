http      = require 'http'
fs        = require 'fs'
url       = require 'url'
path      = require 'path'

class @Server
  @constructor: () ->

  #Start HTTP Server async on localhost
  startHTTP: (http_port, callback) ->
    port       = parseInt(process.env.PORT) || http_port || 5000

    # Handle non-Bayeux requests
    requestHandler = (request, response) ->
      uri = url.parse(request.url).pathname
      filename = path.join(process.cwd(), './assets/index.html')
      response.writeHead(200, {'Content-Type': 'text/html'})
      fs.readFile filename, (error, content) ->
        response.write(content)
        response.end()
    
    @httpServer = http.createServer requestHandler
    
    @httpServer.listen Number(port), ->
      # console.log "HTTP server started on port #{Number(port)}"
      callback()

  stop: ->
    @httpServer.close()
