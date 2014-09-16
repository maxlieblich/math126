(function() {
  var scene = new MathScene("cone");
  var f = function (x, y, z){
    return x*x + y*y - z*z;
  }
  scene.camera.position.set(8, 8, 4);
  window.UWMaterial = new THREE.MeshPhongMaterial({
    ambient: 0x39275b,
    color: 0xc79900,
    specular: 0x111111,
    shininess: 20,
    side: THREE.DoubleSide
  })
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: UWMaterial.clone()});
  MathModel.embedInScene(surface, scene);
  scene.render();
}());

(function() {
  var scene = new MathScene("cylinder");
  var f = function (x, y, z){
    return y*y - x*x*(x-1);
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: UWMaterial.clone()});
  MathModel.embedInScene(surface, scene);
  scene.render();
}());

(function () {
  var scene = new MathScene("ellipsoid");
  var f = function (x, y, z){
    return 1/2*x*x + 1/3 * y*y + z*z - 1;
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: UWMaterial.clone()});
  MathModel.embedInScene(surface, scene);
  scene.render();
}());

(function () {
  var scene = new MathScene("hyp-par");
  var f = function (x, y, z){
    return 1/9 * x*x - 1/4 * y*y - z;
  }
  scene.camera.position.set(8, 8, 4);
  var surface = new MarchingCubesModel({func: f, resolution: 150, material: UWMaterial.clone()});
  MathModel.embedInScene(surface, scene);
  scene.render();
}());

(function () {
  var scene = new MathScene("ell-par");
  var f = function (x, y, z){
    return 1/9 * x*x + 1/4 * y*y - z;
  }
  scene.camera.position.set(16, 16, 8);
  scene.cameraControls.target.set(0, 0, 6)
  var surface = new MarchingCubesModel({
    func: f,
    resolution: 150,
    xmin: -10,
    xmax: 10,
    ymin: -10,
    ymax: 10,
    zmin: 0,
    zmax: 10, material: UWMaterial.clone()});
    MathModel.embedInScene(surface, scene);
    scene.render();
  }());
