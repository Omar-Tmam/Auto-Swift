import 'package:auto_swift/Features/admin_view/data/repos/car_repo_impl.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/views/admin_view.dart';
import 'package:auto_swift/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:auto_swift/Features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:auto_swift/Features/auth/presentation/views/auth_page.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:auto_swift/Features/home_view/presentation/views/car_details_view.dart';
import 'package:auto_swift/Features/home_view/presentation/views/home_view.dart';
import 'package:auto_swift/Features/home_view/presentation/views/widgets/mobile/mobile_home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

abstract class AppRouter {
  static const kAuthView = '/';
  static const kAdminView = '/adminView';
  static const kCarDetailsView = '/carDetailsView';
  static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kAuthView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl()),
          child: const AuthPage(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kCarDetailsView,
        builder: (context, state) => CarDetailsView(
          car: state.extra as Car,
        ),
      ),
      GoRoute(
        path: kAdminView,
        builder: (context, state) => BlocProvider(
          create: (context) => CarCubit(CarRepoImpl(
              picker: ImagePicker(),
              firestore: FirebaseFirestore.instance,
              storage: FirebaseStorage.instance)),
          child: const AdminView(),
        ),
      ),
    ],
  );
}
