import 'package:auto_swift/Core/cubits/cubit/theme_cubit.dart';
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/contact_seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
                color: context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? Colors.yellow
                    : Colors.black,
                context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? CupertinoIcons.sun_max_fill
                    : CupertinoIcons.moon_fill),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          )
        ],
        title: CustomText(
          text: '${car.brand} ${car.name}',
          fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
          fontSize: getResponsiveFontSize(context, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // صورة العربية
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
            child: Image.network(
              car.image,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // تفاصيل العربية
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black54
                  : Colors.blueGrey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // اسم العربية + الماركة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          text: car.name.isNotEmpty ? car.name : "Unknown Car",
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 22),
                          fontWeight:
                              AppStyles.styleSemiBold22(context).fontWeight,
                        ),
                        Chip(
                          label: CustomText(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            text: car.brand,
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 14),
                            fontWeight:
                                AppStyles.styleSemiBold18(context).fontWeight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    CustomText(
                        text:
                            "Car Price: ${car.price.isNotEmpty ? car.price : "--"} \$",
                        fontSize: getResponsiveFontSize(context, fontSize: 18),
                        fontWeight:
                            AppStyles.styleSemiBold18(context).fontWeight,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                    const Divider(height: 32),

                    // معلومات إضافية
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoIcon(
                          context,
                          FontAwesomeIcons.gaugeHigh,
                          car.speed.isNotEmpty ? "${car.speed} km/h" : "--",
                        ),
                        _buildInfoIcon(
                          context,
                          FontAwesomeIcons.gasPump,
                          "Petrol",
                        ),
                        _buildInfoIcon(
                          context,
                          FontAwesomeIcons.gear,
                          car.engine.isNotEmpty ? car.engine : "--",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

 
          ContactSeller(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: FaIcon(icon, size: 22, color: Colors.black87),
        ),
        const SizedBox(height: 8),
        CustomText(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          text: label,
          fontSize: getResponsiveFontSize(context, fontSize: 14),
          fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
        ),
      ],
    );
  }
}

