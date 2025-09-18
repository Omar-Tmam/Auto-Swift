import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          if (state is CarImageLoading) {
            return const Center(
                child: CupertinoActivityIndicator(
              color: Colors.white,
            ));
          } else if (state is CarImagePicked) {
            return TextButton.icon(
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: const Icon(Icons.check, color: Colors.green),
              label: CustomText(
                text: "Image Selected",
                color: Colors.green,
                fontSize: AppStyles.styleRegular16(context).fontSize,
              ),
            );
          } else if (state is CarImageError) {
            return TextButton.icon(
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: const Icon(Icons.image, color: Colors.red),
              label: CustomText(
                text: "Retry Image",
                color: Colors.red,
                fontSize: AppStyles.styleRegular16(context).fontSize,
              ),
            );
          } else {
            return TextButton.icon(
              onPressed: () => context.read<CarCubit>().pickImage(),
              icon: Icon(
                Icons.image,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
              label: CustomText(
                fontSize: AppStyles.styleRegular16(context).fontSize,
                text: "Pick Image",
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
