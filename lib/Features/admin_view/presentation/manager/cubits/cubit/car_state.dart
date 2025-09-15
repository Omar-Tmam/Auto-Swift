class CarState {}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarSuccess extends CarState {}

class CarFailure extends CarState {
  final String message;
  CarFailure(this.message);
}

class CarImageLoading extends CarState {}

class CarImagePicked extends CarState {
  final String imageUrl;
  CarImagePicked(this.imageUrl);
}

class CarImageError extends CarState {
  final String message;
  CarImageError(this.message);
}