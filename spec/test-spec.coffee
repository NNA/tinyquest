vows = require('vows')                            
assert = require('assert')                        
 
class Downloader                                  
  getAsync: (param, cb) ->                        
    setTimeout () ->                              
      console.log("\nDEBUG: CALLING CALLBACK")    
      cb(undefined, 'results')                    
    , 2000                                        
 
vows.describe('Downloader').addBatch(             
  'getAsync':                                     
    topic: () ->                                  
      (new Downloader).getAsync('path', @callback)
      undefined                                   
 
    'has results': (err, result) ->               
      console.log("\nDEBUG: ASSERTION")           
      assert.equal result, 'results'              
)
#).export(module)
