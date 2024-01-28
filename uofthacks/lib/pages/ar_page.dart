import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

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

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitBox(width: 0.6, height: 0.4, length: 0.1),
        position: Vector3(0, 0, -0.5));
    // final node = ARKitReferenceNode(
    //   url: 'models.scnassets/Envelope.dae',
    //   scale: vector.Vector3.all(0.3),
    // );
    this.arkitController.add(node);
  }
}
