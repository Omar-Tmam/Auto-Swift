import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

