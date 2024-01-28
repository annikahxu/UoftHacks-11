import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARView extends StatefulWidget {
  const ARView({super.key});

  @override
  _ARViewState createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ARKitSceneView(
        onARKitViewCreated: onARKitViewCreated,
      ),
    );
  }

  void onARKitViewCreated(ARKitController controller) {
    arkitController = controller;

    arkitController = controller;

    final material = ARKitMaterial(
      diffuse: ARKitMaterialProperty.color(Colors.blue),
      transparency: 0.8,
    );

    final square = ARKitPlane(
      materials: [material],
      width: 0.1, // 10cm square
      height: 0.1,
    );

    final node = ARKitNode(
      geometry: square,
      position: vector.Vector3(0, 0, -0.5), // 50cm in front of the camera
    );

    arkitController.add(node);
  }
}
