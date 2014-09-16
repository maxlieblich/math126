(function() {
    var scene = new MathScene("trefoil");
    var trefoilFunc = function(t) {
          var t2, t3;
          t2 = t + t;
          t3 = t2 + t;
          return 41 * Math.cos(t) - 18 * Math.sin(t) - 83 * Math.cos(t2) - 83 * Math.sin(t2) - 11 * Math.cos(t3) + 27 * Math.sin(t3);
        };
    var trefoilPoint = function(t) {
          var kScale, x, y, z;
          kScale = 0.01;
          x = trefoilFunc(t);
          y = trefoilFunc(6.283185 - t);
          z = trefoilFunc(t - 1.828453);
          return new THREE.Vector3(kScale * x, kScale * y, kScale * z);
        };
    var x = function (t) { return trefoilPoint(t).x; }
    var y = function (t) { return trefoilPoint(t).y; }
    var z = function (t) { return trefoilPoint(t).z; }
    var ppath = new ParametricPathModel(x, y, z, [-4, 4], 1.3);
    MathModel.embedInScene(ppath, scene);
    scene.animate();
}());

(function() {
    var scene = new MathScene("heart");
   // var a = Math.cos(0.65);
   // var b = Math.sin(0.65);
    var f = function (x, y, z) {
    //    var x = a * xx  - b * yy;
    //    var y = b * xx + a * yy;
        return Math.pow(x * x + (9/4) * y * y + z * z - 1, 3)- x * x * z * z * z -  (9/80) * y * y * z * z * z;
    }
    var mc = new MarchingCubesModel({func: f, resolution: 150, smoothingLevel: 1});
    MathModel.embedInScene(mc, scene);
    scene.render();
}());

(function() {
    var scene = new MathScene("sphere");
    var f = function (x, y, z) {
        return x*x + y*y + z*z - 1;
    }
    var mc = new MarchingCubesModel({func: f, xmin: -1.5, xmax: 1.5, ymin: -1.5, ymax: 1.5, zmin: -1.5, zmax: 1.5, resolution: 50});
    MathModel.embedInScene(mc, scene);
    scene.render();
}());

(function() {
    var scene = new MathScene("ellipsoid");
    var f = function (x, y, z) {
        return x*x + 2*y*y + 0.5*z*z - 1;
    }
    var mc = new MarchingCubesModel({func: f, xmin: -2, xmax: 2, ymin: -2, ymax: 2, zmin: -2, zmax: 2, resolution: 50});
    MathModel.embedInScene(mc, scene);
    scene.render();
}());
