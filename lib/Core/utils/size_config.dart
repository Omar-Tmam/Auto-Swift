import 'package:flutter/widgets.dart';

class SizeConfig {
  static const double tabletBreakPoint = 800;

  static late double width, height;

  static init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
