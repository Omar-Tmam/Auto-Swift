
import 'package:auto_swift/Features/admin_view/data/repos/car_repo.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarCubit extends Cubit<CarState> {
  final CarRepo carRepo;
  String? imageUrl;

  CarCubit(this.carRepo) : super(CarInitial());

  Future<void> pickImage() async {
    try {
      emit(CarImageLoading());
      imageUrl = await carRepo.uploadCarImage();
      emit(CarImagePicked(imageUrl!));
    } catch (e) {
      emit(CarImageError(e.toString()));
    }
  }

  Future<void> submitCar({
    required String name,
    required String price,
    required String engine,
    required String speed,

    required String brand,
  }) async {
    try {
      if (imageUrl == null) throw Exception("Please pick an image first");
      emit(CarLoading());
      await carRepo.addCar(
        name: name,
        price: price,
        engine: engine,
        speed: speed,

        brand: brand,
        imageUrl: imageUrl!,
      );

      emit(CarSuccess());
    } catch (e) {
      emit(CarFailure(e.toString()));
    }
  }
}