import 'dart:io';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vector_math/vector_math_64.dart';

class ArViewModel {

  ArViewModel({required this.arkitController});

  final ARKitController arkitController;
  ARKitGltfNode? itemNode;

  void onARTapHandler(List<ARKitTestResult> results) async {
    final points = results.firstWhere((e) => e.type == ARKitHitTestResultType.featurePoint);
    final position = _getPointPosition(points);
    final File file = await _downloadFile("https://raw.githubusercontent.com/olexale/arkit_flutter_plugin/refs/heads/master/example/assets/gltf/Box.gltf");
    if (itemNode == null) {
      itemNode = _createObjectNode(position, file.path);
      arkitController.add(itemNode!);
    } else {
      itemNode!.position = position;
    }
  }

  Future<File> _downloadFile(String url) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/${url.split("/").last}';
      await Dio().download(url, filePath);
      final file = File(filePath);
      print('Download completed!! path = $filePath');
      return file;
    } catch (e) {
      print('Caught an exception: $e');
      rethrow;
    }
  }

  Vector3 _getPointPosition(ARKitTestResult points) => Vector3(points.worldTransform.getColumn(3).x, points.worldTransform.getColumn(3).y, points.worldTransform.getColumn(3).z);

  ARKitGltfNode _createObjectNode(Vector3 position, String path) {
    return ARKitGltfNode(
      url: path.split("/").last,
      position: position,
      scale: Vector3(0.1, 0.1, 0.1),
      assetType: AssetType.documents,
    );
  }
}