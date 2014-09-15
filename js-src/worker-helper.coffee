importScripts "marchingcubesraw.js"
self.onmessage = (e) ->
    self.onmessage = null # Clean-up
    console.log e.data
    eval e.data