import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/models/user_model.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.loginRepo, required this.registerRepo})
      : super(AuthInitial());
  final LoginRepo loginRepo;
  final RegisterRepo registerRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await loginRepo.login(email: email, password: password);
    result.fold((l) => emit(AuthError(errorMessage: l.errorMessage)), (r) {
      emit(AuthSuccess(user: User.fromJson(r)));
    });
  }
}
