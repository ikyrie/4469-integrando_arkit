class FurnitureInfos {
  final String id;
  final String name;
  final String description;
  final double price;

  FurnitureInfos({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory FurnitureInfos.fromJson(String id, Map<String, dynamic> json) {
    return FurnitureInfos(
      id: id,
      name: json["name"],
      description: json["description"],
      price: (json["price"] as num).toDouble(),
    );
  }
}
