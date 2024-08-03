import 'package:ecommerceapp/features/auth_feature/domain/entities/user_entity.dart';
import 'package:ecommerceapp/features/auth_feature/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    emit(SignInLoading());
    final result =
        await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity)));
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity)));
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(SignInFailure(failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity)));
  }








}
