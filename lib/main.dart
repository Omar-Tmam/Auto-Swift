import 'package:auto_swift/Core/utils/app_router.dart';
import 'package:auto_swift/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AutoSwift());
}

class AutoSwift extends StatelessWidget {
  const AutoSwift({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: const TextStyle(color: Colors.white),
          bodyMedium: const TextStyle(color: Colors.white),
          bodySmall: const TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
