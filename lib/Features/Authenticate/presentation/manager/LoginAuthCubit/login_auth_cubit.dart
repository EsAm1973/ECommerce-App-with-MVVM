import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/models/user_model.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/login_repo.dart';
import 'package:equatable/equatable.dart';

part 'login_auth_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit({required this.loginRepo}) : super(LoginAuthInitial());
  final LoginRepo loginRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginAuthLoading());
    final result = await loginRepo.login(email: email, password: password);
    result.fold((l) => {emit(LoginAuthError(errorMessage: l.errorMessage))},
        (r) => {emit(LoginAuthSuccess(user: User.fromJson(r)))});
  }
}
