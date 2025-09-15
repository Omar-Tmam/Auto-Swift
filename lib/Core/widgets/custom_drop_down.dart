import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, this.value, required this.valid, required this.hint, required this.items, this.onChanged});
  final String? value;
  final String valid, hint;
  final List<DropdownMenuItem<String>> items;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      value: value,
      validator: (value) => value == null ? valid :null,
      items: items,
      onChanged: onChanged,
    );
  }
}
