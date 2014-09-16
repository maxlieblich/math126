(function(){
	var scene = new MathScene("torus");
	scene.camera.position.set(0, 1, 10);
	var torusgeo = new THREE.TorusGeometry(2, 1, 64, 48);

	var torus = new THREE.Mesh(torusgeo, new THREE.MeshPhongMaterial({
		ambient: 0x555555,
		color: 0xee0000,
		emmissive: 0x00eeee,
		specular: 0x123456,
		shininess: 5,
		opacity: 0.7,
		transparent: true,
		side: THREE.DoubleSide
	}));

	scene.scene.add(torus);

	var electron = new THREE.Mesh(new THREE.SphereGeometry(0.1), new THREE.MeshLambertMaterial({
		ambient: 0x555555,
		color: 0xffff00,
		reflectivity: 100,
		side: THREE.DoubleSide
	}));

	scene.scene.add(electron);

	electron.position.set(1, 0, 0);

	scene.calc = function(t) {
		t = t / 1000;
		electron.position.set(Math.cos(t) * (2 - Math.cos(4 * t)), Math.sin(t) * (2 - Math.cos(4 * t)), Math.sin(4 * t));
		// console.log(scene);
	};

	scene.render();
}());