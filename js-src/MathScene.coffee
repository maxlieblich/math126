class MathScene
  HEIGHT: 400
  WIDTH: 700
  shadow: null
  guiActive: false
  live: false
  animated: false
  initTime: 3000
  showingObjects: false
  # static material for surfaces, made from official UW colors
  # lame
  @UWMaterial: new THREE.MeshPhongMaterial({
    ambient: 0x39275b,
    color: 0xc79900,
    specular: 0x111111,
    shininess: 20,
    side: THREE.DoubleSide
  })

  constructor: (containerName) ->
    if containerName?
      @container = document.getElementById containerName
    else
      @container = document.body.appendChild(document.createElement("div"))
    @container.style.position = "relative"
    webGLEnabled = @populate()
    if not webGLEnabled
      return
    @mathUp()
    @shadow = false
    @guiActive = false
    return

  setrenderer: ->
    if Detector.webgl
      @renderer = new THREE.WebGLRenderer({preserveDrawingBuffer: true, antialias: true})
      @renderer.setClearColor( 0x111111, 1 );
    else # this should never be called
      @renderer = new THREE.CanvasRenderer()
    return

  setCameraControls: =>
    @cameraControls = new THREE.TrackballControls @camera, @renderer.domElement
    @cameraControls.target.set 0, 0, 0
    @cameraControls.addEventListener 'end', @kill
    @cameraControls.addEventListener 'start', @birth
    null 

  enableShadow: ->
    @renderer.shadowMapEnabled = true
    @renderer.shadowMapSoft = true
    # @renderer.shadowCameraNear = 3
    # @renderer.shadowCameraFar = @camera.far
    # @renderer.shadowCameraFov = 50
    @renderer.shadowMapBias = 0.0039
    @renderer.shadowMapDarkness = 1.0
    @renderer.shadowMapWidth = 1024
    @renderer.shadowMapHeight = 1024
    null

  replaceStaticImage: =>
    # swap static image for canvas and add controls
    # (including snapshot controls)
    elts = @container.getElementsByTagName("img")
    for elt in elts
      elt.style.display = "none"
    @renderer.domElement.style.display = "block"
    @cameraControls.handleResize()
    @showGui()
    null

  # this populates the basic objects, but they will not be inserted into the page
  # until at least one object is embedded in the scene or the create() method is called explicitly
  populate: ->
    # test code: remove below comment to test static images
    # return false

    if not Detector.webgl
      return false

    @scene = new THREE.Scene()
    @scene.add(new THREE.AmbientLight 0xffffff)
    @scene.add(new THREE.DirectionalLight 0xffffff)

    if not @camera
      @camera = new THREE.PerspectiveCamera 45, @WIDTH/@HEIGHT
      @camera.position.set 3, 3, 3
    if @shadow
      @enableShadow()
      @pointLight = new THREE.SpotLight 0xffffff
      @pointLight.castShadow = true
    else
      @pointLight = new THREE.PointLight 0xffffff
    @pointLight.intensity = 1
    @pointLight.position.set 0, 0, 100
    @scene.add @pointLight

    # camera
    @scene.add @camera

    # renderer
    @setrenderer()
    @renderer.setSize @WIDTH, @HEIGHT
    @renderer.domElement.style.position = "relative"
    @renderer.domElement.style.display = "none"
    @container.appendChild @renderer.domElement
    @renderer.clear()

    # dat.gui controls
    @gui = new dat.GUI({autoPlace: false})
    @gui.domElement.style.position = "absolute"
    @gui.domElement.style.left = 0
    @gui.domElement.style.top = 0
    @gui.close()
    # temporary snapshot facility
    # actually, make this permanent if students make something they like (once playground is up)!
    # TODO: make it possible to show/hide images they have taken in page. Will be easy.
    @gui.add(@, "generateSnapshot").name("Take picture")
    @activateGui()
    @hideGui()

    #controls
    @setCameraControls()

    true

  create: =>
    @birth()
    setTimeout @kill, @initTime
    @showingObjects = true

  birth: =>
    @live = true
    @animate()
    return

  kill: =>
    @replaceStaticImage()
    @live = false
    return

  # inspired by http://jsfiddle.net/TxcTr/3/
  generateSnapshot: ->
    @hideGui()
    imgData = @renderer.domElement.toDataURL()
    imgNode = document.createElement("img")
    imgNode.src = imgData
    @container.appendChild(imgNode)
    @showGui()
    return

  loadSnapshot: ->
    throw "Not yet implemented"
    return

  activateGui: ->
    if not @guiActive
      @container.appendChild(@gui.domElement)
      @guiActive = true
    null

  hideGui: ->
    @gui.domElement.style.display = "none"
    return

  showGui: ->
    @gui.domElement.style.display = "" # OOPS. What did I mean here? It seems to work, though.
    return

  mathUp: ->
    @camera.up = new THREE.Vector3 0, 0, 1

  addaxes: (length)->
    @scene.add new THREE.AxisHelper(length)
    null

  render: =>
    @cameraControls?.update()
    @pointLight.position = @camera.position
    @renderer.render @scene, @camera
    null

  calc: (t) ->

  animate: =>
    self = @
    framing = (t) ->
      self.calc(t)
      self.render()
      if self.animated or self.live
        requestAnimationFrame framing, self.container
      null
    framing(new Date().getTime())
    null

  # create the dom elements and add to the internal THREE.js scene
  add: (obj) ->
    @create()
    @scene.add obj
    null

# worth it to use a smarter way to do this than attaching it to the window?
window.MathScene = MathScene