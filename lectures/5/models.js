(function(){
var scene = new MathScene("warm-up");
scene.scene.add(new THREE.AxisHelper(3));
scene.camera.position.set(6, 8, 4);
var plane1 = new PlaneShadowModel({
  normal: [3, 4, 5],
  position: [0, 0, 0],
  color: 0xaaaa00
  });
var plane2 = new PlaneShadowModel({
  normal: [-3, 5, 0],
  position: [0, 0, 0],
  color: 0x00aaaa
  });
  MathModel.embedInScene(plane1, scene);
  MathModel.embedInScene(plane2, scene);
  scene.render();
}());

(function(){
var scene = new MathScene("simple");
scene.scene.add(new THREE.AxisHelper(3));
scene.camera.position.set(6, 8, 4);
var plane1 = new PlaneShadowModel({
  normal: [1, 0, 0],
  position: [0, 0, 0],
  color: 0xaaaa00
  });
var plane2 = new PlaneShadowModel({
  normal: [0, 1, 0],
  position: [0, 0, 0],
  color: 0x00aaaa
  });
  MathModel.embedInScene(plane1, scene);
  MathModel.embedInScene(plane2, scene);
  scene.render();
}());
