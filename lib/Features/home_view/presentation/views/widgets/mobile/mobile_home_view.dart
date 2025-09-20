import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/mobile_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:auto_swift/Core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MobileHomeViewBody(),
    );
  }
}
