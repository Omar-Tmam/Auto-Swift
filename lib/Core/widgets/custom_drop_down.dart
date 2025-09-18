import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.value,
    required this.valid,
    required this.hint,
    this.items,
    this.onChanged,
  });
  final String? value;
  final String valid, hint;
  final List<DropdownMenuItem<String>>? items;
  final Function(dynamic v)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField2(
        value: value,
        validator: (value) => value == null ? valid : null,
        items: items,
        onChanged: onChanged,
        isDense: true,
        hint: Text(hint, style: TextStyle(fontSize: 13)),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.arrow_forward_ios, size: 14),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]
              : Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white, width: 0)),
        ),
      ),
    );
  }
}
