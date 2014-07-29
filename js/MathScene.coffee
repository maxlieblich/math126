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
      @renderer.setClearColor( 0xfcfcfc, 1 ); 
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

  #   #MOVE THIS METHOD INTO EACH MATHMODEL -- LET THEM DECIDE HOW THEY EMBED INTO SCENES!
  # embedModel: (model) =>
  #   model.scene = @scene
  #   for obj in model.objects
  #     @scene.add(obj)
    
  #   old_calc = @calc
  #   @calc = (t) ->
  #     if model.calc?
  #       model.calc()(t)
  #     old_calc(t)
  #     # console.log @scene
  #     null

  #   if model.needsGui
  #     @activateGui()
  #     model.addGui(@gui)
  #   null

class MathModel
  calc: null
  needsGui: false
  embedInScene: (mathScene) ->
    @mathScene = mathScene
    @embedObjects()
    that = @
    old_calc = mathScene.calc
    mathScene.calc = (t) ->
      if that.calc?
        that.calc()(t)
      old_calc(t)
      null

    if @needsGui
      mathScene.activateGui()
      @addGui(mathScene.gui)
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
  scene: null
  surface: null

  constructor: ({@func, @xmin, @xmax, 
                @ymin, @ymax, @zmin, @zmax, 
                @resolution, @smoothingLevel, 
                @material,
                @name}) ->
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

    # geom = @march()
    # @surface = new THREE.Mesh(geom, @material)
    @march_async(true)
    @needsGui = true
  
  embedObjects: ->
    @march_async(true)
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
    @march_async(true)    

  addGui: (gui) ->
    # console.log @
    f = gui.addFolder(@name)
    f.add(@, 'xmin').step(0.05)
    f.add(@, 'xmax').step(0.05)
    f.add(@, 'ymin').step(0.05)
    f.add(@, 'ymax').step(0.05)
    f.add(@, 'zmin').step(0.05)
    f.add(@, 'zmax').step(0.05)
    f.add(@, 'resolution', 40, 150).step(1)
    f.add(@, 'smoothingLevel', 0, 2).step(1)
    f.add(@, 'rerender_async')
    f.add(@, 'debug')
    f.open()
    null

  # see http://stackoverflow.com/a/10372280
  # Need to use "fallback 2" in order to import the right scripts in the worker
  march_async: (b) ->
    that = @
    debug = @debug
    window.URL = window.URL || window.webkitURL
    f = @func.toString()
    mc = marchingCubes.toString()
    
    response = """marchingCubes = #{mc}
    self.onmessage = function (e) {
      output = marchingCubes([#{@resolution}, #{@resolution}, #{@resolution}], #{f}, [[#{@xmin}, #{@ymin}, #{@zmin}],[#{@xmax}, #{@ymax}, #{@zmax}]]);
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
      console.log raw_data
      # vs = raw_data.positions
      # fs = raw_data.cells
      flat_positions = raw_data.positions
      flat_normals = raw_data.normals
      geometry = new THREE.BufferGeometry()
      geometry.addAttribute( 'position', new THREE.BufferAttribute( flat_positions, 3 ) );
      geometry.addAttribute( 'normal', new THREE.BufferAttribute( flat_normals, 3 ) );
      
      # geometry = new THREE.Geometry()
      # for v in vs
      #   geometry.vertices.push new THREE.Vector3 v[0], v[1], v[2]
      # for f in fs
      #   geometry.faces.push new THREE.Face3 f[0], f[1], f[2]
      # if debug
      #   console.log geometry.vertices.length + " vertices created"
      # geometry.mergeVertices()
      # geometry.computeFaceNormals()
      # geometry.computeVertexNormals()
      # if debug
      #   console.log geometry
      smooth = geometry #that.modify geometry
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


  march: ->
    # Generate a list of 3D points and values at those points
    points = []
    values = []
    debug = @debug
    if debug
      console.log @xmin
      console.log @xmax
      console.log @ymin
      console.log @ymax
      console.log @zmin
      console.log @zmax
    xMin = @xmin
    xRange = @xmax - @xmin
    yMin = @ymin
    yRange = @ymax - @ymin
    zMin = @zmin
    zRange = @zmax - @zmin
    size = @resolution
    f = @func
    l = @level

    for k in [0..size - 1]
      for j in [0..size - 1]
        for i in [0..size - 1]
          # actual values
          x = xMin + xRange * i / (size - 1)
          y = yMin + yRange * j / (size - 1)
          z = zMin + zRange * k / (size - 1)
          points.push new THREE.Vector3(x, y, z)
          value = f(x, y, z) - l
          values.push value
          # if debug
          #   if not value
          #     console.log "(x, y, z): " + x + ", " + y + ", " + z + "; " + value
    console.log points.length + " values computed"
    
    # Marching Cubes Algorithm
    size2 = size * size

    # Vertices may occur along edges of cube, when the values at the edge's endpoints
    #   straddle the isolevel value.
    # Actual position along edge weighted according to function values.
    vlist = new Array(12)
    geometry = new THREE.Geometry()
    vertexIndex = 0
    for z in [0..size - 1]
      # console.log "z=" + z
      for y in [0..size - 1]
        for x in [0..size - 1]
          # index of base point, and also adjacent points on cube
          p = x + size * y + size2 * z
          px = p + 1
          py = p + size
          pxy = py + 1
          pz = p + size2
          pxz = px + size2
          pyz = py + size2
          pxyz = pxy + size2
          
          # store scalar values corresponding to vertices
          value0 = values[p]
          value1 = values[px]
          value2 = values[py]
          value3 = values[pxy]
          value4 = values[pz]
          value5 = values[pxz]
          value6 = values[pyz]
          value7 = values[pxyz]
          
          # place a "1" in bit positions corresponding to vertices whose
          #   isovalue is less than given constant.
          isolevel = 0
          cubeindex = 0
          cubeindex |= 1  if value0 < isolevel
          cubeindex |= 2  if value1 < isolevel
          cubeindex |= 8  if value2 < isolevel
          cubeindex |= 4  if value3 < isolevel
          cubeindex |= 16  if value4 < isolevel
          cubeindex |= 32  if value5 < isolevel
          cubeindex |= 128  if value6 < isolevel
          cubeindex |= 64  if value7 < isolevel
          
          # bits = 12 bit number, indicates which edges are crossed by the isosurface
          bits = THREE.edgeTable[cubeindex]
          
          # if none are crossed, proceed to next iteration
          continue  if bits is 0
          
          # check which edges are crossed, and estimate the point location
          #    using a weighted average of scalar values at edge endpoints.
          # store the vertex in an array for use later.
          mu = 0.5
          
          # bottom of the cube
          if bits & 1
            mu = (isolevel - value0) / (value1 - value0)
            vlist[0] = points[p].clone().lerp(points[px], mu)
          if bits & 2
            mu = (isolevel - value1) / (value3 - value1)
            vlist[1] = points[px].clone().lerp(points[pxy], mu)
          if bits & 4
            mu = (isolevel - value2) / (value3 - value2)
            vlist[2] = points[py].clone().lerp(points[pxy], mu)
          if bits & 8
            mu = (isolevel - value0) / (value2 - value0)
            vlist[3] = points[p].clone().lerp(points[py], mu)
          
          # top of the cube
          if bits & 16
            mu = (isolevel - value4) / (value5 - value4)
            vlist[4] = points[pz].clone().lerp(points[pxz], mu)
          if bits & 32
            mu = (isolevel - value5) / (value7 - value5)
            vlist[5] = points[pxz].clone().lerp(points[pxyz], mu)
          if bits & 64
            mu = (isolevel - value6) / (value7 - value6)
            vlist[6] = points[pyz].clone().lerp(points[pxyz], mu)
          if bits & 128
            mu = (isolevel - value4) / (value6 - value4)
            vlist[7] = points[pz].clone().lerp(points[pyz], mu)
          
          # vertical lines of the cube
          if bits & 256
            mu = (isolevel - value0) / (value4 - value0)
            vlist[8] = points[p].clone().lerp(points[pz], mu)
          if bits & 512
            mu = (isolevel - value1) / (value5 - value1)
            vlist[9] = points[px].clone().lerp(points[pxz], mu)
          if bits & 1024
            mu = (isolevel - value3) / (value7 - value3)
            vlist[10] = points[pxy].clone().lerp(points[pxyz], mu)
          if bits & 2048
            mu = (isolevel - value2) / (value6 - value2)
            vlist[11] = points[py].clone().lerp(points[pyz], mu)
          
          # construct triangles -- get correct vertices from triTable.
          i = 0
          cubeindex <<= 4 # multiply by 16...
          # "Re-purpose cubeindex into an offset into triTable." 
          #  since each row really isn't a row.
          
          # the while loop should run at most 5 times,
          #   since the 16th entry in each row is a -1.
          until THREE.triTable[cubeindex + i] is -1
            index1 = THREE.triTable[cubeindex + i]
            index2 = THREE.triTable[cubeindex + i + 1]
            index3 = THREE.triTable[cubeindex + i + 2]
            geometry.vertices.push vlist[index1].clone()
            geometry.vertices.push vlist[index2].clone()
            geometry.vertices.push vlist[index3].clone()
            face = new THREE.Face3(vertexIndex, vertexIndex + 1, vertexIndex + 2)
            geometry.faces.push face
            geometry.faceVertexUvs[0].push [
              new THREE.Vector2(0, 0)
              new THREE.Vector2(0, 1)
              new THREE.Vector2(1, 1)
            ]
            vertexIndex += 3
            i += 3
    if debug
      console.log geometry.vertices.length + " vertices created"
    geometry.mergeVertices()
    geometry.computeFaceNormals()
    geometry.computeVertexNormals()
    if debug
      console.log geometry
    smooth = @modify geometry
    smooth

    # @objects.push(new THREE.Mesh(smooth, new THREE.MeshNormalMaterial({side: THREE.DoubleSide})))
    # null

  modify: (geometry) ->
    smooth = geometry.clone()
    smooth.mergeVertices()
    modifier = new THREE.SubdivisionModifier @smoothingLevel
    modifier.modify(smooth)
    smooth

window.MathScene = MathScene
window.ParametricPathModel = ParametricPathModel
window.MarchingCubesModel = MarchingCubesModel