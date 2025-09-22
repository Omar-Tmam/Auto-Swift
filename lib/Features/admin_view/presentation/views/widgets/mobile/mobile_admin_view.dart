import 'package:auto_swift/Core/cubits/cubit/theme_cubit.dart';
import 'package:auto_swift/Core/utils/app_styles.dart';
import 'package:auto_swift/Core/widgets/custom_text.dart';
import 'package:auto_swift/Features/admin_view/presentation/views/widgets/mobile/mobile_admin_view_body.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileLayoutAdminView extends StatelessWidget {
  const MobileLayoutAdminView({super.key});

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
        centerTitle: true,
        title: CustomText(
          text: 'Admin Page',
          fontSize: AppStyles.styleSemiBold22(context).fontSize,
          fontWeight: AppStyles.styleSemiBold22(context).fontWeight,
        ),
      ),
      body: const MobileAdminViewBody(),
    );
  }
}
