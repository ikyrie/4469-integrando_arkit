import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:toca_moveis/domain/models/furniture.dart';
import 'package:toca_moveis/ui/ar/view/ar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:toca_moveis/ui/ar/widgets/control_button.dart';

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
      appBar: AppBar(title: Text(widget.furniture.name)),
      body: Stack(
        children: [
        ARKitSceneView(
          showFeaturePoints: true,
          enableTapRecognizer: true,
          onARKitViewCreated: onARKitViewCreated,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                ControlButton(
                    onTap: () => arViewModel.rotateLeft(), icon: Icons.rotate_left),
                ControlButton(
                    onTap: () => arViewModel.rotateRight(),
                    icon: Icons.rotate_right),
                ControlButton(onTap: () => arViewModel.scaleUp(), icon: Icons.add),
                ControlButton(
                    onTap: () => arViewModel.scaleDown(), icon: Icons.remove),
            ],),
          ),
        ),
      ]
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