import 'package:auto_swift/Core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AutoSwift());
}

class AutoSwift extends StatelessWidget {
  const AutoSwift({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}