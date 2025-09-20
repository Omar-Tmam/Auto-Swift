import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/mobile_home_view_body.dart';
import 'package:flutter/material.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
      ),
      body: MobileHomeViewBody(),
    );
  }
}
