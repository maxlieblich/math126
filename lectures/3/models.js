
(function (){
  var scene = new MathScene("shadow");
  var plane = new PlaneShadowModel({
    normal: [1, -1, 1],
    position: [0, 0, 0],
    color: 0xff0000,
    xrange: [-10, 10],
    yrange: [-10, 10]
    });
  var vector = new VectorModel({
    color: 0x0000ff,
    origin: [0, 0, 0],
    vector: [3, 4, 5]
    });
  vector.arrow.castShadow = true;
  // cheating so I don't have to ask for lines to cast shadows
  var shadowLineGeo = new THREE.Geometry();
  var shadowLineMat = new THREE.MeshBasicMaterial({color: 0x000000});
  shadowLineGeo.vertices.push(new THREE.Vector3(0, 0, 0), new THREE.Vector3(1.666, 5.333, 3.666));
  scene.scene.add(new THREE.Line(shadowLineGeo, shadowLineMat));
  scene.camera.position.set(10, -10, 0);
  MathModel.embedInScene(plane, scene);
  MathModel.embedInScene(vector, scene);
  scene.renderloop();
  })();
