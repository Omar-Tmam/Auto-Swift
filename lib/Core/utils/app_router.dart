import 'package:auto_swift/Features/admin_view/data/repos/car_repo_impl.dart';
import 'package:auto_swift/Features/admin_view/presentation/manager/cubits/cubit/car_cubit.dart';
import 'package:auto_swift/Features/admin_view/presentation/views/admin_view.dart';
import 'package:auto_swift/Features/home_view/data/models/car_model.dart';
import 'package:auto_swift/Features/home_view/presentation/views/car_details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

abstract class AppRouter {
  static const kAdminView = '/';
  static const kCarDetailsView = '/carDetailsView';
  static final router = GoRouter(
    routes: [
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
