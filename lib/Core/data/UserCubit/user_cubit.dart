import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Core/data/repositories/user_database_repo.dart';
import 'package:ecommerce_app/Core/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository userRepository;

  UserCubit({required this.userRepository}) : super(UserInitial());

  User? get currentUser {
    if (state is UserLoaded) {
      return (state as UserLoaded).user;
    }
    return null;
  }

  Future<void> loadUser() async {
    try {
      emit(UserLoading());
      final user = await userRepository.getUser();
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(UserInitial());
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> saveUser(User user) async {
    try {
      await userRepository.saveUser(user);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
