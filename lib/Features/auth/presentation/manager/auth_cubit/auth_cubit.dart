import 'package:auto_swift/Features/auth/data/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;
  UserCredential? userCredential;
  String? role;

  final _firestore = FirebaseFirestore.instance;

  Future<void> logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      userCredential = await authRepo.logIn(email, password);

      // get role
      final uid = userCredential!.user!.uid;
      final doc = await _firestore.collection("users").doc(uid).get();
      if (doc.exists) {
        role = doc['role'];
      } else {
        role = "user"; // fallback
      }

      emit(AuthLoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errMsg: e.message ?? "Login failed"));
    } catch (e) {
      emit(AuthFailure(errMsg: e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      userCredential = await authRepo.signUp(email, password);
      role = "user"; // default

      emit(AuthSignUpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errMsg: e.message ?? "Sign up failed"));
    } catch (e) {
      emit(AuthFailure(errMsg: e.toString()));
    }
  }
}
