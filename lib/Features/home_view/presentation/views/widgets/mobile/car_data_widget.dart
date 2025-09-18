import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:flutter/material.dart';

class CarDataWidget extends StatelessWidget {
  const CarDataWidget({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        CustomText(
          text: car.brand,
          color: Colors.blueAccent,
          fontWeight:
              AppStyles.styleSemiBold22(context)
                  .fontWeight,
          fontSize: getResponsiveFontSize(context,
              fontSize: 16),
        ),
        CustomText(
          text: car.name,
          color: Colors.blueAccent,
          fontWeight:
              AppStyles.styleSemiBold22(context)
                  .fontWeight,
          fontSize: getResponsiveFontSize(context,
              fontSize: 16),
        ),
        const SizedBox(height: 6),
        CustomText(
          text: 'Price: ${car.price} \$',
          fontSize: getResponsiveFontSize(context,
              fontSize: 14),
          fontWeight:
              AppStyles.styleSemiBold18(context)
                  .fontWeight,
          color: Colors.green,
        ),
        const SizedBox(height: 4),
        CustomText(
          text: 'Speed: ${car.speed} km/h',
          fontSize: getResponsiveFontSize(context,
              fontSize: 14),
          fontWeight:
              AppStyles.styleSemiBold18(context)
                  .fontWeight,
        ),
        const SizedBox(height: 4),
        CustomText(
          text: 'Engine: ${car.engine}',
          fontSize: getResponsiveFontSize(context,
              fontSize: 14),
          fontWeight:
              AppStyles.styleSemiBold18(context)
                  .fontWeight,
          color: Colors.grey[700],
        ),
      ],
    );
  }
}