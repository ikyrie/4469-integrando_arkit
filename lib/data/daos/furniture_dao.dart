import 'dart:convert';
import 'package:http/http.dart' as http;

class FurnitureDAO {
  final String url =
      "https://github.com/ricarthlima/ar-mobilia/raw/refs/heads/main/furniture_infos.json";

  Future<Map<String, dynamic>> fetchFurnitureData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body)["infos"] as Map<String, dynamic>;
    } else {
      throw Exception("Erro ao buscar dados: ${response.statusCode}");
    }
  }
}
