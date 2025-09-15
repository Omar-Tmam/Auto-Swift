import 'package:auto_swift/Features/admin_view/presentation/views/admin_view.dart';
import 'package:go_router/go_router.dart';



abstract class AppRouter {
  static const kAdminView = '/';
  static final router = GoRouter(routes: [
    GoRoute(path: kAdminView,builder: (context, state) => AdminView(),)
  ]);
}
