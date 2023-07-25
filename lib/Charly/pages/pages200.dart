import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
// import 'dart:ui';

class FileGLBtest extends StatelessWidget {
  const FileGLBtest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Archivo GLB 3D table'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BabylonJSViewer(src: 'assets/logos/testTable.glb'),
    );
  }
}

class FileGLBtestHouse extends StatelessWidget {
  const FileGLBtestHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Archivo GLB 3D house'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BabylonJSViewer(src: 'assets/logos/testHouse.glb'),
    );
  }
}

class FileGLBtestHouseObj extends StatefulWidget {
  const FileGLBtestHouseObj({super.key});

  @override
  State<FileGLBtestHouseObj> createState() => _FileGLBtestHouseObjState();
}

class _FileGLBtestHouseObjState extends State<FileGLBtestHouseObj> {
  late Object house;
  final List<List<double>> equations = const [
    [7, -2, 1],
    [14, -7, -3],
    [-7, 11, 18]
    // [14, -4, 2]
  ];

  final List<List<double>> example = const [
    [-4, 4, -3, 8, -8, 4, 2],
    [9, -3, -2, 5, 7, 5, 3],
    [-6, -3, 2, -1, 3, 7, -5],
    [2, 4, 8, -3, 7, -7, 7],
    [-3, 7, -3, -4, 5, -8, 4],
    [-9, -4, -7, -4, 2, -1, 8],
    [-8, -2, -8, -8, -4, 1, 7],
  ];

  final equations2 = const [
    [3.0, -4.0],
    [2.0, 4.0]
  ];
  /* final luSolver = LUSolver(
      matrix: RealMatrix.fromData(rows: 2, columns: 2, data: equations2),
      knownValues: [-6.0, 16.0]); */

  /* final solutions = luSolver.solve(); // [-1, 4, 3]
  final determinant = luSolver.determinant(); // -84.0 */

// final SystemSolver luSolver2 = SORSolver()
// final luSolver2 = LUSolver(matrix: RealMatrix(rows: 3, columns: 3), knownValues: equations)
/* final luSolver = LUSolver(
  
  constants: const [3, 1, 5], knownValues: [], matrix: null
);

final solutions = luSolver.solve(); // [-4, 8, -17] */

  @override
  void initState() {
    // house = loadMtl('assets/logos/Lamborghini2.mtl');
    // Object(fileName: 'assets/logos/Lamborghini2.mtl');
    // house = Object(fileName: 'assets/logos/Car/1377 Car.obj');
    // house = Object(fileName: 'assets/logos/Lamborghini.obj');
    house = Object(fileName: 'assets/logos/testHouseObj.obj');
    house.rotation.setValues(0, 90, 0);
    house.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final luSolver = LUSolver(
        matrix: RealMatrix.fromData(
            rows: example.length, columns: example.length, data: example),
        knownValues: [-115, -75, 135, -10, -28, 13, 12]);
    // knownValues: [12.0, 17.0, 5.0]);
    // knownValues: [-6.0, 16.0]);
    final solutions = luSolver.solve(); // [-1, 4, 3]
    final determinant = luSolver.determinant(); // -84.0
    /* print('equations.lenght: ' +
        equations.getRange(0, example.length).length.toString());
    // print('equations.lenght: ' + equations.getRange(0, equations.length).length.toString());
    print(example.length);
    print('luSolver: ' + luSolver.toString()); */
    print(luSolver);
    print('luSolverToStringAugmented: ' + luSolver.toStringAugmented());
    print(luSolver.toStringAugmented);
    print('Solucion: ' + solutions.toString());
    print(solutions);
    for (var element in solutions) {
      print('Charly element');
      print(element);
    }
    print('I1: ' + solutions[0].round().toString());
    print(solutions);
    print('Determinante: ' + determinant.toString());
    print(determinant);
    for (var i = 0; i < solutions.length; i++) {
      print('I${i + 1}= ${solutions[i].round().toString()}\n');
    }
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Archivo Obj 3D house'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Cube(
        onSceneCreated: (Scene scene) {
          scene.world.add(house);
          scene.camera.zoom = 5;
          // scene.world.lighting = true;
          // scene.light.ambient.b = 10;
        },
      ),
      // body: BabylonJSViewer(src: 'https://models.babylonjs.com/boombox.glb'),
      // body: BabylonJSViewer(src: 'assets/logos/testHouseObj.obj'),
    );
  }
}

class FileGLBtesHomerStl extends StatelessWidget {
  const FileGLBtesHomerStl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Archivo STL 3D homer'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: /* SceneBox() */
          /* Scene(
        onObjectCreated: (object) {
          
        object.add(Object(fileName: 'assets/logos/Car/1377 Car.obj');),
        } 
      ) */
          BabylonJSViewer(src: 'assets/logos/testHomer.stl'),
    );
  }
}
