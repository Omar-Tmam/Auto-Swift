import 'package:auto_swift/Core/utils/app_router.dart';
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/utils/size_config.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:auto_swift/Features/home_view/data/repos/stream_repo_impl.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/brand_selector.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/card_item.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/home_view_header.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/home_view_welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileHomeViewBody extends StatefulWidget {
  const MobileHomeViewBody({super.key});

  @override
  State<MobileHomeViewBody> createState() => _MobileHomeViewBodyState();
}

class _MobileHomeViewBodyState extends State<MobileHomeViewBody> {
  String? selectedBrand;

  final List<String> brands = [
    "BMW",
    "Audi",
    "Mercedes",
    "Honda",
    "Lamborghini",
    "Ferrari",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    context.push(AppRouter.kAuthView);
                  },
                  icon: const Icon(Icons.logout)),
              HomeViewHeader(),
            ],
          ),

          const SizedBox(height: 20),

          /// hello
          HomeViewWelcome(),
          CustomText(
            color: Colors.grey,
            text: ' Choose your ideal car',
            fontSize: AppStyles.styleRegular16(context).fontSize,
            fontWeight: AppStyles.styleRegular16(context).fontWeight,
          ),
          const SizedBox(height: 20),

          /// الفلتر (براندز)
          BrandSelector(
            brands: brands,
            selectedBrand: selectedBrand,
            onBrandSelected: (brand) {
              setState(() {
                selectedBrand = brand;
              });
            },
          ),
          const SizedBox(height: 20),

          /// عرض العربيات
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: StreamRepoImpl().carsStream(selectedBrand ?? ''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: CustomText(
                    text: 'Choose a brand',
                    fontSize: getResponsiveFontSize(context, fontSize: 26),
                  ));
                }
                final cars = snapshot.data!.docs
                    .map((doc) =>
                        Car.fromFirestore(doc.data() as Map<String, dynamic>))
                    .toList();
                return GridView.builder(
                  itemCount: cars.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 12,
                    childAspectRatio: MediaQuery.sizeOf(context).width >
                            SizeConfig.tabletBreakPoint
                        ? 1 / 1.2
                        : 1 / 1.7,
                  ),
                  itemBuilder: (context, index) {
                    final car = cars[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(AppRouter.kCarDetailsView, extra: car);
                      },
                      child: CardItem(car: car),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
