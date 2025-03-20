import 'package:toca_moveis/domain/models/furniture_infos.dart';

import '../daos/furniture_dao.dart';

class FurnitureService {
  final FurnitureDAO dao = FurnitureDAO();

  Future<List<FurnitureInfos>> getFurnitureList() async {
    final data = await dao.fetchFurnitureData();
    return data.entries
        .map((entry) => FurnitureInfos.fromJson(entry.key, entry.value))
        .toList();
  }
}
