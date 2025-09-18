import 'package:auto_swift/Core/widgets/custom_container.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BrandSelector extends StatelessWidget {
  final List<String> brands;
  final String? selectedBrand;
  final Function(String?) onBrandSelected;

  const BrandSelector({
    super.key,
    required this.brands,
    required this.selectedBrand,
    required this.onBrandSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: brands.map((brand) {
          final isSelected = selectedBrand == brand;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                if (selectedBrand == brand) {
                  onBrandSelected(null); // deselect
                } else {
                  onBrandSelected(brand); // select
                }
              },
              child: CustomContainer(
                radius: 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
    );
  }
}
