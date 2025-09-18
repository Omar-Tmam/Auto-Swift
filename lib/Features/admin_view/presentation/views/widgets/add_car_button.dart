import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_button.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCarButton extends StatelessWidget {
  const AddCarButton({
    super.key,
    required TextEditingController model,
    required TextEditingController price,
    required TextEditingController engine,
    required TextEditingController speed,
    required this.selectedBrand,
  })  : _model = model,
        _price = price,
        _engine = engine,
        _speed = speed;

  final TextEditingController _model;
  final TextEditingController _price;
  final TextEditingController _engine;
  final TextEditingController _speed;
  final String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        if (state is CarSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added Car Successfully "),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is CarFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to Add Car  ${state.message}"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          radius: 8,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.blueAccent,
          height: 40,
          onTap: () {
            context.read<CarCubit>().submitCar(
                  car: Car(
                    brand: selectedBrand ?? '',
                    name: _model.text,
                    price: _price.text,
                    speed: _speed.text,
                    engine: _engine.text,
                    image: context.read<CarCubit>().imageUrl ?? '',
                  ),
                );
            _model.clear();
            _price.clear();
            _engine.clear();
            _speed.clear();
            context.read<CarCubit>().reset();
          },
          width: double.infinity,
          child: state is CarLoading
              ? const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: CustomText(
                  fontWeight: FontWeight.w500,
                  fontSize: AppStyles.styleRegular16(context).fontSize,
                  text: 'Add Car',
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                )),
        );
      },
    );
  }
}
