import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeViewWelcome extends StatelessWidget {
  const HomeViewWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          color: Colors.grey,
          text: 'Hello,',
          fontSize: getResponsiveFontSize(context, fontSize: 40),
          fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
        ),
        CustomText(
          text: ' Omar',
          fontSize: getResponsiveFontSize(context, fontSize: 40),
          fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
        )
      ],
    );
  }
}
