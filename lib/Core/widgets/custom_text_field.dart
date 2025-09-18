import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.type,
    required this.borderColor, // لازم يحدد من بره
    this.prefix,
    this.maxLength,
    this.borderRadius = 12,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final Widget? prefix;
  final int? maxLength;
  final Color borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: hint,
      keyboardType: type,
      suffix: prefix,
      maxLength: maxLength,
      placeholderStyle: AppStyles.styleRegular16(context),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
