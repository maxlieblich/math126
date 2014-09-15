class MathScene
  HEIGHT: 400
  WIDTH: 700
  shadow: null
  live: null
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

  setrenderer: ->
    if Detector.webgl
      @renderer = new THREE.WebGLRenderer({preserveDrawingBuffer: true, antialias: true})
      @renderer.setClearColor( 0xdddddd, 1 ); 
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
    @container.appendChild(@gui.domElement)
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

  embedModel: (model) =>
    for obj in model.objects
      @scene.add(obj)
    
    old_calc = @calc
    @calc = (t) ->
      if model.calc?
        model.calc()(t)
      old_calc(t)
      # console.log @scene
      null

    null

class MathModel
  calc: null
  objects: []

# x, y, z functions of t
class ParametricPathModel# extends MathModel
  limits: [-1, 1]
  speed: 2
  resolution: 100
  mover: new THREE.Mesh(new THREE.SphereGeometry(0.03), new THREE.MeshNormalMaterial())
  calc: null
  objects: null
  constructor: (@x, @y, @z, limits = [-1, 1], speed = 2) ->
    @objects = []
    @limits = limits
    @speed = speed
    @mover.geometry.dynamic = true # necessary?
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
    @objects.push(@mover)
    @objects.push(@path)


class MarchingCubesModel# extends MathModel
  xlim: [-3, 3]
  ylim: [-3, 3]
  zlim: [-3, 3]
  level: 0
  func: null
  resolution: 40
  objects: null
  calc: null
  smoothingLevel: 0

  constructor: (@func, @xlim = [-3, 3], 
                @ylim = [-3, 3], @zlim = [-3, 3], 
                @resolution = 40, @smoothingLevel = 0, 
                @material = new THREE.MeshNormalMaterial({side: THREE.DoubleSide})) ->
    @objects = []
    geom = @march()
    @objects.push new THREE.Mesh(geom, @material)

  march: ->
    # Generate a list of 3D points and values at those points
    points = []
    values = []
    xMin = @xlim[0]
    xRange = @xlim[1] - @xlim[0]
    yMin = @ylim[0]
    yRange = @ylim[1] - @ylim[0]
    zMin = @zlim[0]
    zRange = @zlim[1] - @zlim[0]
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
    console.log "values computed"
    
    # Marching Cubes Algorithm
    size2 = size * size

    # Vertices may occur along edges of cube, when the values at the edge's endpoints
    #   straddle the isolevel value.
    # Actual position along edge weighted according to function values.
    vlist = new Array(12)
    geometry = new THREE.Geometry()
    vertexIndex = 0
    for z in [0..size - 1]
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
    geometry.mergeVertices()
    geometry.computeFaceNormals()
    geometry.computeVertexNormals()
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