import 'package:auto_swift/Core/utils/size_config.dart';
import 'package:flutter/material.dart';


abstract class AppStyles {
  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
    );
  }

  static TextStyle styleSemiBold22(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context, fontSize: 22),
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodySmall?.color,
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // better for mobile and no context;
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // var width = physicalWidth / devicePixelRatio;
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreakPoint) {
    return width / 450;
  } else {
    return width / 800;
  }
}
