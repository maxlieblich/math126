class MathScene
  HEIGHT: 400
  WIDTH: 700
  shadow: null
  live: null
  guiActive: false
  constructor: (containerName) ->
    if containerName?
      @container = document.getElementById containerName
    else
      @container = document.body.appendChild(document.createElement("div"))
    @container.style.position = "relative"
    @populate()
    @mathUp()
    @live = true
    @shadow = false
    @guiActive = false

  setrenderer: ->
    if Detector.webgl
      @renderer = new THREE.WebGLRenderer({preserveDrawingBuffer: true, antialias: true})
      @renderer.setClearColor( 0x111111, 1 ); 
    else 
      @renderer = new THREE.CanvasRenderer()
    return
  
  loader: new THREE.JSONLoader(true)

  populate: ->
    @scene = new THREE.Scene()
    @scene.add(new THREE.AmbientLight 0xffffff)
    @scene.add(new THREE.DirectionalLight 0xffffff)

    if not @camera
      @camera = new THREE.PerspectiveCamera 45, @WIDTH/@HEIGHT
      @camera.position.set 3, 3, 3
    if @shadow
      @renderer.shadowMapEnabled = true
      @renderer.shadowMapSoft = true
      @renderer.shadowCameraNear = 3
      @renderer.shadowCameraFar = @camera.far
      @renderer.shadowCameraFov = 50
      @renderer.shadowMapBias = 0.0039
      @renderer.shadowMapDarkness = 1.0
      @renderer.shadowMapWidth = 1024
      @renderer.shadowMapHeight = 1024
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
    @container.appendChild @renderer.domElement
    @renderer.clear()

    # dat.gui controls
    @gui = new dat.GUI({autoPlace: false})
    @gui.domElement.style.position = "absolute"
    @gui.domElement.style.left = 0
    @gui.domElement.style.top = 0
    @gui.close()

    #controls
    # @cameraControls = new THREE.OrbitControls @camera, @renderer.domElement
    @cameraControls = new THREE.TrackballControls @camera, @renderer.domElement
    @cameraControls.target.set 0, 0, 0
    # @cameraControls.screen = { width: @WIDTH, height: @HEIGHT, offsetLeft: 0, offsetTop: 0 }
    # @cameraControls.radius = ( @cameraControls.screen.width + @cameraControls.screen.height ) / 4;
    # @cameraControls.target.set 0, 0, 0
    # @cameraControls.center.set 0, 0, 0
    # @cameraControls.userPanSpeed = 0.1
    null

  activateGui: ->
    if not @guiActive
      @container.appendChild(@gui.domElement)
      @guiActive = true
    null

  mathUp: ->
    @camera.up = new THREE.Vector3 0,0,1

  addaxes: (length)->
    @scene.add new THREE.AxisHelper(length)
    null
  
  render: ->
    if @live
      @cameraControls.update()
      @pointLight.position = @camera.position
    @renderer.render @scene,@camera
    null
  
  calc: (t) ->  
  
  animate: ->
    self = @
    framing = (t) ->
      self.calc(t)
      self.render()
      requestAnimationFrame framing, self.container if self.live
      null
    framing(new Date().getTime())  
    null
  
  initTime: 3000  
  
  renderloop: =>
    @live = true
    @animate()
  
  init: ->
    T = new Date().getTime()
    @live = false
    @render()
    null

  go: ->
    @init()
    null


class MathModel
  calc: null
  needsGui: false
  @embedInScene: (model, mathScene) ->
    model.mathScene = mathScene
    model.embedObjects()
    old_calc = mathScene.calc
    mathScene.calc = (t) ->
      if model.calc?
        model.calc()(t)
      old_calc(t)
      null

    if model.needsGui
      mathScene.activateGui()
      model.addGui(mathScene.gui)
    null


# x, y, z functions of t
class ParametricPathModel extends MathModel
  limits: [-1, 1]
  speed: 2
  resolution: 100
  mover: null
  calc: null
  objects: null
  needsGui: false

  constructor: (@x, @y, @z, limits = [-1, 1], speed = 2) ->
    @limits = limits
    @speed = speed
    @mover = new THREE.Mesh(new THREE.SphereGeometry(0.03), new THREE.MeshNormalMaterial())
    @calc = ->
      self = @
      (t) -> 
        # v = new THREE.Vector3(self.x(t), self.y(t), self.z(t))
        # console.log v
        T = self.speed * t / 1000
        self.mover.position.set self.x(T), self.y(T), self.z(T)
        # self.mover.geometry.verticesNeedUpdate = true
        null
    geometry = new THREE.Geometry()  
    for i in [1..100]
      t = @limits[0] + (@limits[1] - @limits[0]) * i / 100.0
      geometry.vertices.push(new THREE.Vector3(@x(t), @y(t), @z(t)))
    @path = new THREE.Line(geometry, new THREE.LineBasicMaterial({color: 0xff0000}))

  embedObjects: ->
    @mathScene.scene.add(@mover)
    @mathScene.scene.add(@path)


class MarchingCubesModel extends MathModel
  xmin: -3.00
  xmax: 3.00
  ymin: -3.00
  ymax: 3.00
  zmin: -3.00
  zmax: 3.00
  level: 0
  func: null
  resolution: 40
  calc: null
  smoothingLevel: 0
  needsGui: false
  name: ""
  surface: null
  algorithm: null

  constructor: ({@func, @xmin, @xmax, 
                @ymin, @ymax, @zmin, @zmax, 
                @resolution, @smoothingLevel, 
                @material,
                @name, @algorithm}) ->
    @xmin ?= -3.00
    @xmax ?= 3.00
    @ymin ?= -3.00
    @ymax ?= 3.00
    @zmin ?= -3.00
    @zmax ?= 3.00
    @resolution ?= 40
    @smoothingLevel ?= 0
    @material ?= new THREE.MeshNormalMaterial({side: THREE.DoubleSide})
    @name ?= "Surface"
    @debug = false
    @algorithm ?= "surfaceNets"

    # geom = @march()
    # @surface = new THREE.Mesh(geom, @material)
    @march_async(true)
    @needsGui = true

  embedObjects: ->
    @march_async(true, @algorithm)
    null
    # @mathScene.scene.add(@surface)

  rerender: ->
    if @mathScene?
      @mathScene.scene.remove(@surface)
      console.log "surface removed"
      geom = @march()
      @surface = new THREE.Mesh(geom, @material)
      console.log "surface constructed"
      @mathScene.scene.add(@surface)
      console.log "surface embedded"
      # console.log @scene
      # console.log @objects 
    null

  rerender_async: ->
    @march_async(true, @algorithm)    

  addGui: (gui) ->
    # console.log @
    f = gui.addFolder(@name)
    f.add(@, 'xmin').step(0.05)
    f.add(@, 'xmax').step(0.05)
    f.add(@, 'ymin').step(0.05)
    f.add(@, 'ymax').step(0.05)
    f.add(@, 'zmin').step(0.05)
    f.add(@, 'zmax').step(0.05)
    f.add(@, 'resolution', 40, 800).step(1)
    f.add(@, 'algorithm', ['marchingCubes', 'marchingTetrahedra', 'surfaceNets'])
    # f.add(@, 'smoothingLevel', 0, 2).step(1)
    f.add(@, 'rerender_async')
    # f.add(@, 'debug')
    f.open()
    null

  # see http://stackoverflow.com/a/10372280 for starting Workers via blobs
  march_async: (b, algorithm="marchingCubes") ->
    that = @
    debug = @debug
    window.URL = window.URL || window.webkitURL
    f = @func.toString()
    mc = null
    if @algorithm is 'marchingCubes'
      mc = marchingCubes.toString()
    else if @algorithm is 'marchingTetrahedra'
      mc = marchingTetrahedra.toString()
    else if @algorithm is 'surfaceNets'
      mc = surfaceNets.toString()
    
    response = """#{algorithm} = #{mc}
    self.onmessage = function (e) {
      output = #{algorithm}([#{@resolution}, #{@resolution}, #{@resolution}], #{f}, [[#{@xmin}, #{@ymin}, #{@zmin}],[#{@xmax}, #{@ymax}, #{@zmax}]]);
      postMessage(output);
      } 
    """
    blob = null
    try 
      blob = new Blob([response], {type: 'application/javascript'})
    catch e  # Backwards-compatibility
      window.BlobBuilder = window.BlobBuilder || window.WebKitBlobBuilder || window.MozBlobBuilder
      blob = new BlobBuilder()
      blob.append(response)
      blob = blob.getBlob()
    
    worker = new Worker URL.createObjectURL(blob)

    worker.onmessage = (e) -> 
      raw_data = e.data
      # console.log raw_data
      # vs = raw_data.positions
      # fs = raw_data.cells
      flat_positions = raw_data.positions
      flat_normals = raw_data.normals
      geometry = new THREE.BufferGeometry()
      geometry.addAttribute( 'position', new THREE.BufferAttribute( flat_positions, 3 ) );
      geometry.addAttribute( 'normal', new THREE.BufferAttribute( flat_normals, 3 ) );
      
      smooth = geometry #that.modify geometry FORGET THE CATMULL-CLARK SMOOTHING. it's too annoying with buffergeometry
      new_surface = new THREE.Mesh(smooth, that.material)
      if b
        if that.mathScene?
          that.mathScene.scene.remove(that.surface)
          console.log "surface removed"
          that.surface = new_surface
          console.log "surface constructed"
          that.mathScene.scene.add(that.surface)
          console.log "surface embedded"
      null

    worker.postMessage("Go!")
    null

  modify: (geometry) ->
    smooth = geometry.clone()
    smooth.mergeVertices()
    modifier = new THREE.SubdivisionModifier @smoothingLevel
    modifier.modify(smooth)
    smooth


class VectorModel extends MathModel
  origin: null
  vector: null
  arrow: null

  constructor: ({origin, vector, color}) ->
    origin ?= [0, 0, 0]
    @orig = new THREE.Vector3(origin[0], origin[1], origin[2])
    vector ?= [1, 0, 0]
    @vec = new THREE.Vector3(vector[0], vector[1], vector[2])
    # @arrow = new THREE.ArrowHelper(new THREE.Vector3(1, 0, 0), new THREE.Vector3(0, 0, 0), 2.0, 0x756218)
    color ?= 0xff00ff
    @col = color
    dir = @vec.clone().normalize()
    @arrow = new THREE.ArrowHelper(dir, @orig.clone(), @vec.length(), @col)
    @arrow.cone.material = new THREE.MeshLambertMaterial({ambient: @col, color: 0xcccccc, opacity: 1.0})
    return

  embedObjects: ->
    @mathScene.scene.add(@arrow)
    null

window.MathScene = MathScene
window.MathModel = MathModel
window.ParametricPathModel = ParametricPathModel
window.MarchingCubesModel = MarchingCubesModel
window.VectorModel = VectorModel