import 'dart:convert';

class Furniture {
  String name;
  String description;
  double price;

  String capture;
  String captureWA;
  String glbZip;
  String glTFZip;
  String glb;

  Furniture({
    required this.name,
    required this.description,
    required this.price,
    required this.capture,
    required this.captureWA,
    required this.glbZip,
    required this.glTFZip,
    required this.glb,
  });

  Furniture copyWith({
    String? name,
    String? description,
    double? price,
    String? capture,
    String? captureWA,
    String? glbZip,
    String? glTFZip,
    String? glb,
  }) {
    return Furniture(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      capture: capture ?? this.capture,
      captureWA: captureWA ?? this.captureWA,
      glbZip: glbZip ?? this.glbZip,
      glTFZip: glTFZip ?? this.glTFZip,
      glb: glb ?? this.glb,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'capture': capture,
      'captureWA': captureWA,
      'glbZip': glbZip,
      'glTFZip': glTFZip,
      'glb': glb,
    };
  }

  factory Furniture.fromMap(Map<String, dynamic> map) {
    return Furniture(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      capture: map['capture'] as String,
      captureWA: map['captureWA'] as String,
      glbZip: map['glbZip'] as String,
      glTFZip: map['glTFZip'] as String,
      glb: map['glb'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Furniture.fromJson(String source) =>
      Furniture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Furniture(name: $name, description: $description, price: $price, capture: $capture, captureWA: $captureWA, glbZip: $glbZip, glTFZip: $glTFZip, glb: $glb)';
  }

  @override
  bool operator ==(covariant Furniture other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.price == price &&
        other.capture == capture &&
        other.captureWA == captureWA &&
        other.glbZip == glbZip &&
        other.glTFZip == glTFZip &&
        other.glb == glb;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        capture.hashCode ^
        captureWA.hashCode ^
        glbZip.hashCode ^
        glTFZip.hashCode ^
        glb.hashCode;
  }
}
