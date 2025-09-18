import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/admin_view/presentation/views/widgets/mobile/mobile_admin_view_body.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/mobile_home_view_body.dart';
import 'package:flutter/material.dart';

class MobileLayoutAdminView extends StatelessWidget {
  const MobileLayoutAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Admin Page',
          fontSize: AppStyles.styleSemiBold22(context).fontSize,
        ),
      ),
      body: MobileHomeViewBody(),
    );
  }
}
