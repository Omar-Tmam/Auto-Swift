abstract class CarRepo {
  Future<String> uploadCarImage(); 
  Future<void> addCar({
    required String name,
    required String price,
    required String engine,
    required String speed,

    required String brand,
    required String imageUrl,
  });
}