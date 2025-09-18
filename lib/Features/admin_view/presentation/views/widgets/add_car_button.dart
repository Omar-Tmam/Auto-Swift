import 'package:auto_swift/Core/widgets/custom_button.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        return CustomButton(
          radius: 8,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.blue
              : Colors.black,
          height: 35,
          onTap: () {
            context.read<CarCubit>().submitCar(
                name: _model.text,
                price: _price.text,
                engine: _engine.text,
                speed: _speed.text,
                brand: selectedBrand ?? '');
          },
          width: double.infinity,
          child: state is CarLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Center(
                  child: CustomText(
                  text: 'Add Car',
                  color: Colors.white,
                )),
        );
      },
    );
  }
}
