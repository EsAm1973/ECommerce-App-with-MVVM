part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterAuthLoading extends RegisterState {}

final class RegisterAuthSuccess extends RegisterState {
  final User user;

  const RegisterAuthSuccess({required this.user});
}

final class RegisterAuthError extends RegisterState {
  final String errorMessage;

  const RegisterAuthError({required this.errorMessage});
}
