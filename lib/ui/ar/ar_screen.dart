import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

class ArScreen extends StatefulWidget {
  const ArScreen({super.key});

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  late ARKitController arkitController;
  ARKitNode? itemNode;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ARKit in Flutter')),
      body: ARKitSceneView(
        showFeaturePoints: true,
        enableTapRecognizer: true,
        onARKitViewCreated: onARKitViewCreated,
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.addCoachingOverlay(CoachingOverlayGoal.horizontalPlane);
    this.arkitController.onARTap = (ar) => onARTapHandler(ar);

  }

  void onARTapHandler(List<ARKitTestResult> results) {
    final points = results.firstWhere((e) => e.type == ARKitHitTestResultType.featurePoint);
    final position = Vector3(points.worldTransform.getColumn(3).x, points.worldTransform.getColumn(3).y, points.worldTransform.getColumn(3).z);
    if (itemNode == null) {
      itemNode = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: position);
      arkitController.add(itemNode!);
    } else {
      itemNode!.position = position;
    }
  }
}