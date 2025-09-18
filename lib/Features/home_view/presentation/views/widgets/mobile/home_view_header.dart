import 'package:auto_swift/Core/cubits/cubit/theme_cubit.dart';
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    );
  }
}
