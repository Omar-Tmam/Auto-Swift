import 'package:auto_swift/Features/home_view/data/models/car_model.dart';

abstract class CarRepo {
  Future<String> uploadCarImage(); 
  Future<void> addCar({
   required Car car,
  });
}