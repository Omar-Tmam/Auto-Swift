import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Core/widgets/custom_drop_down.dart';
import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:auto_swift/Core/widgets/pick_image_widget.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_state.dart';
import 'package:auto_swift/Features/admin_view/presentation/views/widgets/add_car_button.dart';
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

  List<String> brands = [
    "BMW",
    "Audi",
    "Mercedes",
    "Honda",
    "Lamborghini",
    "Ferrari",
  ];

  String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// العنوان الرئيسي
              CustomText(
                text: "Add a New Car ",
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveFontSize(context, fontSize: 20),
              ),
              const SizedBox(height: 24),

              /// Row (Price + Speed)
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      borderColor: Colors.white,
                      controller: _price,
                      hint: 'Car Price',
                      type: TextInputType.number,
                      suffix: const Icon(Icons.attach_money),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      borderColor: Colors.white,
                      controller: _speed,
                      hint: 'Car Speed (km/h)',
                      type: TextInputType.number,
                      suffix: const Icon(Icons.speed),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Car Model
              CustomTextField(
                borderColor: Colors.white,
                controller: _model,
                hint: 'Car Model',
                type: TextInputType.text,
                suffix: const Icon(Icons.directions_car),
              ),
              const SizedBox(height: 20),

              /// Car Engine
              CustomTextField(
                borderColor: Colors.white,
                controller: _engine,
                hint: 'Car Engine',
                type: TextInputType.text,
                suffix: const Icon(Icons.settings),
              ),
              const SizedBox(height: 20),

              /// Car Brand Dropdown
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
                valid: 'Please select at least one brand',
                hint: 'Car brand',
              ),
              const SizedBox(height: 20),

              /// Pick Image
              const PickImageWidget(),
              const SizedBox(height: 24),

              /// Add Car Button
              AddCarButton(
                model: _model,
                price: _price,
                engine: _engine,
                speed: _speed,
                selectedBrand: selectedBrand,
              ),
            ],
          ),
        );
      },
    );
  }
}
