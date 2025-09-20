part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailure extends AuthState {
  final String errMsg;

  AuthFailure({required this.errMsg});
}

final class AuthLoginSuccess extends AuthState {}

final class AuthSignUpSuccess extends AuthState {}
