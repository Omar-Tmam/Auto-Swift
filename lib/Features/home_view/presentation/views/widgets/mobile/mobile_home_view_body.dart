import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_container.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:auto_swift/Features/home_view/data/repos/stream_repo_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileHomeViewBody extends StatefulWidget {
  const MobileHomeViewBody({super.key});

  @override
  State<MobileHomeViewBody> createState() => _MobileHomeViewBodyState();
}

class _MobileHomeViewBodyState extends State<MobileHomeViewBody> {
  String? selectedBrand; 

  final List<String> brands = ["BMW", "Audi", "Mercedes"];



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// الهيدر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                radius: 30,
              ),
              CustomText(
                text: 'Port said , Egypt',
                fontSize: AppStyles.styleSemiBold22(context).fontSize,
              ),
              const Icon(CupertinoIcons.circle_grid_3x3)
            ],
          ),
          const SizedBox(height: 20),

          /// hello
          Row(
            children: [
              CustomText(
                color: Colors.grey,
                text: 'Hello,',
                fontSize: getResponsiveFontSize(context, fontSize: 40),
                fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
              ),
              CustomText(
                text: ' Omar',
                fontSize: getResponsiveFontSize(context, fontSize: 40),
                fontWeight: AppStyles.styleSemiBold18(context).fontWeight,
              )
            ],
          ),
          CustomText(
            color: Colors.grey,
            text: ' Choose your ideal car',
            fontSize: AppStyles.styleRegular16(context).fontSize,
            fontWeight: AppStyles.styleRegular16(context).fontWeight,
          ),
          const SizedBox(height: 20),

          /// الفلتر (براندز)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: brands.map((brand) {
                final isSelected = selectedBrand == brand;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedBrand == brand) {
                          selectedBrand = null; // لو ضغط تاني يشيل الفلتر
                        } else {
                          selectedBrand = brand;
                        }
                      });
                    },
                    child: CustomContainer(
                      radius: 20,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      color: isSelected ? Colors.blueAccent : Colors.grey[300],
                      child: CustomText(
                        text: brand,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
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
                  return const Center(child: Text('No cars found'));
                }

                final cars = snapshot.data!.docs
                    .map((doc) =>
                        Car.fromFirestore(doc.data() as Map<String, dynamic>))
                    .toList();

                return GridView.builder(
                  itemCount: cars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1 / 1.6,
                  ),
                  itemBuilder: (context, index) {
                    final car = cars[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.network(
                              car.image,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
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
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_circle_right_rounded,
                                    color: Colors.blueAccent,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
