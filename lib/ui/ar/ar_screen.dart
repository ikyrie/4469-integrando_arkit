import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:toca_moveis/ui/ar/view/ar_view_model.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

class ArScreen extends StatefulWidget {
  const ArScreen({super.key});

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  late ARKitController arkitController;

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
    final ArViewModel arViewModel = ArViewModel(arkitController:  arkitController);
    this.arkitController.addCoachingOverlay(CoachingOverlayGoal.horizontalPlane);
    this.arkitController.onARTap = (ar) async => arViewModel.onARTapHandler(ar);
  }

}