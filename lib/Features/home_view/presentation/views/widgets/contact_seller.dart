import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ContactSeller extends StatelessWidget {
  const ContactSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black54
              : Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {},
        child: CustomText(
          text: "Contact Seller",
          fontSize: getResponsiveFontSize(context, fontSize: 18),
          fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
        ),
      ),
    );
  }
}
