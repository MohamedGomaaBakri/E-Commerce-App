import 'package:ecommerceapp/features/auth_feature/domain/entities/user_entity.dart';
import 'package:ecommerceapp/features/auth_feature/domain/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password , String name) async {
    emit(SignUpLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);

    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),

    );
  }
}
