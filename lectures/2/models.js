(function(){
    var scene = new MathScene("vector");
    var vec = new VectorModel({color: 0xff00ff, vector: [1, 2, 2]});
    scene.scene.add(vec.arrow);
    scene.scene.add(new THREE.AxisHelper());
    scene.camera.position.set(4, 6, 5);
    scene.render();
})();


(function(){
    var scene = new MathScene("equivVectors");
    var makeVector = function (pos, dir) {
        var vec = new VectorModel({color: 0xff00ff, origin: pos, vector: dir});
        return vec;
    }
    positions = [[0, 0, 0], [1, 0, 0], [1, 1, 1], [0, 2, 0]];
    for (var i = 0; i < positions.length; i++){
        var vec = makeVector(positions[i], [0.1, 0, 1]);
        MathModel.embedInScene(vec, scene);
    }
    scene.scene.add(new THREE.AxisHelper());
    scene.camera.position.set(-1, 6, 2);
    scene.render();
})();


(function(){
    var scene = new MathScene("vector-check");
    scene.camera.position.set(0, -10, 0);
    scene.cameraControls.enabled = false;
    var makeVector = function (pos, dir) {
        return new VectorModel({color: 0xff0000, origin: pos, vector: dir});
    }
    dir = [3, 0, 4];
    positions = [[-5, 0, -1], [-3, 0, -1], [-1, 0, -1], [2.5, 0, -1], [4.5, 0, 1]];
    dirs = [[1.5, 0, 2], [1.5, 0, 2], [2, 0, 3], [-1.5, 0, 2], [-1.5, 0, -2]]
    vectors = []
    for (var i = 0; i < positions.length; i++){
        var vec = makeVector(positions[i], dirs[i]);
        MathModel.embedInScene(vec, scene);
    }
    scene.render();
})();



(function(){
    var scene = new MathScene("vector-add-1");
    scene.camera.position.set(0, 8, 0);
    scene.cameraControls.enabled = false;
    var v1 = new VectorModel({color: 0xff0000, vector: [1, 0, 2]});
    var v2 = new VectorModel({color: 0x0000ff, vector: [2, 0, -3]});
    // scene.scene.add(v1.arrow);
    // scene.scene.add(v2.arrow);
    MathModel.embedInScene(v1, scene);
    MathModel.embedInScene(v2, scene);
    scene.render();
})();



(function(){
    var scene = new MathScene("vector-add-2");
    scene.camera.position.set(0, 8, 0);
    scene.cameraControls.enabled = false;
    var v1 = new VectorModel({color: 0xff0000, vector: [1, 0, 2]});
    var v2 = new VectorModel({color: 0x0000ff, origin: [1, 0, 2], vector: [2, 0, -3]});
    MathModel.embedInScene(v1, scene);
    MathModel.embedInScene(v2, scene);
    scene.render();
})();



(function(){
    var scene = new MathScene("vector-add-3");
    scene.camera.position.set(0, 8, 0);
    scene.cameraControls.enabled = false;
    var v1 = new VectorModel({color: 0xff0000, vector: [1, 0, 2]});
    var v2 = new VectorModel({color: 0x0000ff, origin: [1, 0, 2], vector: [2, 0, -3]});
    var v3 = new VectorModel({color: 0x551a8b, vector: [3, 0, -1]});
    MathModel.embedInScene(v1, scene);
    MathModel.embedInScene(v2, scene);
    MathModel.embedInScene(v3, scene);
    scene.render();
})();
