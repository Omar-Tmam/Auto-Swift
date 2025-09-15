import 'package:auto_swift/Core/widgets/custom_button.dart';
import 'package:auto_swift/Core/widgets/custom_container.dart';
import 'package:auto_swift/Core/widgets/custom_drop_down.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:auto_swift/Core/widgets/pick_image_widget.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileAdminViewBody extends StatefulWidget {
  const MobileAdminViewBody({super.key});

  @override
  State<MobileAdminViewBody> createState() => _MobileAdminViewBodyState();
}

class _MobileAdminViewBodyState extends State<MobileAdminViewBody> {
  final TextEditingController _model = TextEditingController();
  final TextEditingController _engine = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _speed = TextEditingController();
  List<String> avaliableColors = ['Black', 'Red', 'Blue'];
  List<String> brands = ['BMW', 'Mercedes', 'Audi'];
  String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      color: Colors.red,
                      height: 40,
                      width: 40,
                      radius: 60,
                    ),
                    Icon(CupertinoIcons.share_up),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        borderColor: Colors.white,
                        controller: _price,
                        hint: 'Car Price',
                        type: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        borderColor: Colors.white,
                        controller: _speed,
                        hint: 'Car Speed',
                        type: TextInputType.number),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  borderColor: Colors.white,
                  controller: _model,
                  hint: 'Car Model',
                  type: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  borderColor: Colors.white,
                  controller: _engine,
                  hint: 'Car Engine',
                  type: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              CustomDropdown(
                  onChanged: (p0) {
                    setState(() {
                      selectedBrand = p0 as String;
                    });
                  },
                  items: brands
                      .map((brand) =>
                          DropdownMenuItem(value: brand, child: Text(brand)))
                      .toList(),
                  value: selectedBrand,
                  valid: 'Please select atleast one item',
                  hint: 'Car brand'),
              SizedBox(
                height: 20,
              ),
              PickImageWidget(),
              CustomButton(
                radius: 8,
                color: Colors.black,
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
              )
            ],
          ),
        );
      },
    );
  }
}
