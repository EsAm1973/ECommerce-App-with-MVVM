import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/models/user_model.dart';
import 'package:ecommerce_app/Features/Authenticate/data/repos/register_repo.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    String? image,
  }) async {
    emit(RegisterAuthLoading());
    final result = await registerRepo.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
        image: image);
    result.fold(
        (failure) =>
            emit(RegisterAuthError(errorMessage: failure.errorMessage)),
        (user) {
      emit(RegisterAuthSuccess(user: User.fromJson(user)));
    });
  }
}
