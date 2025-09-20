import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<UserCredential> logIn(String email, String password);
  Future<UserCredential> signUp(String email, String password);
}
