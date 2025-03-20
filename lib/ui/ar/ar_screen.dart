import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:toca_moveis/domain/models/furniture.dart';
import 'package:toca_moveis/ui/ar/view/ar_view_model.dart';
import 'package:flutter/material.dart';

class ArScreen extends StatefulWidget {
  const ArScreen({super.key, required this.furniture});

  final Furniture furniture;

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  late ARKitController arkitController;
  late ArViewModel arViewModel;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => arViewModel.rotateRight(), child: Icon(Icons.rotate_right)),
      appBar: AppBar(title: Text(widget.furniture.name)),
      body: ARKitSceneView(
        showFeaturePoints: true,
        enableTapRecognizer: true,
        onARKitViewCreated: onARKitViewCreated,
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    arViewModel = ArViewModel(arkitController:  arkitController);
    this.arkitController.addCoachingOverlay(CoachingOverlayGoal.horizontalPlane);
    this.arkitController.onARTap = (ar) async => arViewModel.onARTapHandler(ar, widget.furniture.glb);
  }

}