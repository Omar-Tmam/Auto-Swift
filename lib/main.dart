import 'package:auto_swift/Core/cubits/cubit/theme_cubit.dart';
import 'package:auto_swift/Core/utils/app_router.dart';
import 'package:auto_swift/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const AutoSwift(),
    ),
  );
}

class AutoSwift extends StatelessWidget {
  const AutoSwift({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Colors.grey[200],
              appBarTheme: AppBarTheme(
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.grey[200],
              ),
            ),
            themeMode: state,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            darkTheme: ThemeData.dark().copyWith(
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white),
              ),
              appBarTheme: AppBarTheme(
                scrolledUnderElevation: 0,
                elevation: 0,
                backgroundColor: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
