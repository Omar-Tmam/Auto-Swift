
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: BlocBuilder<CarCubit, CarState>(
        buildWhen: (prev, curr) => curr is CarImageLoading || curr is CarImagePicked || curr is CarImageError,
        builder: (context, state) {
          if (state is CarImageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarImagePicked) {
            return TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.check, color: Colors.green),
              label: const Text("Image Selected"),
            );
          } else if (state is CarImageError) {
            return TextButton.icon(
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: const Icon(Icons.image, color: Colors.red),
              label: const Text("Retry Image"),
            );
          } else {
            return TextButton.icon(
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: const Icon(Icons.image),
              label: const Text("Pick Image"),
            );
          }
        },
      ),
    );
  }
}