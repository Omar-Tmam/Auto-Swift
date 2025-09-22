import 'package:auto_swift/Core/cubits/cubit/theme_cubit.dart';
import 'package:auto_swift/Core/utils/app_router.dart';
import 'package:auto_swift/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const AutoSwift(),
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
            themeMode: state,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            darkTheme: ThemeData.dark().copyWith(
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
