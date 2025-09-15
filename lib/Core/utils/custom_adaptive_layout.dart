import 'package:auto_swift/Core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAdaptiveLayout extends StatelessWidget {
  final WidgetBuilder mobileLayout, tabletLayout;

  const CustomAdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < SizeConfig.tabletBreakPoint) {
          return mobileLayout(context);
        } else {
          return tabletLayout(context);
        }
      },
    );
  }
}
