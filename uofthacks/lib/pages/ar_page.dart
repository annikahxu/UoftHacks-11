import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';

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

    // Add ARKit Node or other AR objects here
  }
}
