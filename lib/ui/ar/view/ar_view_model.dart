import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class ArViewModel {

  ArViewModel({required this.arkitController});

  final ARKitController arkitController;
  ARKitGltfNode? itemNode;

  void onARTapHandler(List<ARKitTestResult> results) {
    final points = results.firstWhere((e) => e.type == ARKitHitTestResultType.featurePoint);
    final position = _getPointPosition(points);
    if (itemNode == null) {
      itemNode = _createObjectNode(position);
      arkitController.add(itemNode!);
    } else {
      itemNode!.position = position;
    }
  }

  Vector3 _getPointPosition(ARKitTestResult points) => Vector3(points.worldTransform.getColumn(3).x, points.worldTransform.getColumn(3).y, points.worldTransform.getColumn(3).z);

  ARKitGltfNode _createObjectNode(Vector3 position) {
    return ARKitGltfNode(
      url: "assets/snow_globe.glb",
      position: position,
      scale: Vector3(0.1, 0.1, 0.1),
      assetType: AssetType.flutterAsset,
    );
  }
}