class Car {
  final String brand;
  final String name;
  final String price;
  final String speed;
  final String engine;
  final String image;

  Car({
    required this.brand,
    required this.name,
    required this.price,
    required this.speed,
    required this.engine,
    required this.image,
  });

  factory Car.fromFirestore(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      speed: json['speed'] ?? '',
      engine: json['engine'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
