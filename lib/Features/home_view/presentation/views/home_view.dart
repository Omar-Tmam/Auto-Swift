import 'package:auto_swift/Core/utils/custom_adaptive_layout.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/mobile_home_view.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/tablet/tablet_home_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileHomeView();
  }
}
