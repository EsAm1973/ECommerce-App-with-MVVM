part of 'login_auth_cubit.dart';

sealed class LoginAuthState extends Equatable {
  const LoginAuthState();

  @override
  List<Object> get props => [];
}

final class LoginAuthInitial extends LoginAuthState {}

final class LoginAuthLoading extends LoginAuthState {}

final class LoginAuthSuccess extends LoginAuthState {
  final User user;

  const LoginAuthSuccess({required this.user});
}

final class LoginAuthError extends LoginAuthState {
  final String errorMessage;

  const LoginAuthError({required this.errorMessage});
}
