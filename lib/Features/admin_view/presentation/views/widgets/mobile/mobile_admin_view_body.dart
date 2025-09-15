import 'package:auto_swift/Core/widgets/custom_container.dart';
import 'package:auto_swift/Core/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileAdminViewBody extends StatefulWidget {
  const MobileAdminViewBody({super.key});

  @override
  State<MobileAdminViewBody> createState() => _MobileAdminViewBodyState();
}

class _MobileAdminViewBodyState extends State<MobileAdminViewBody> {
  List<String> avaliableColors = ['Black', 'Red', 'Blue'];
  final TextEditingController _model = TextEditingController();
  final TextEditingController _engine = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _speed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
