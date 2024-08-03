

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/features/auth_feature/data/models/firebase_user.dart';
import 'package:ecommerceapp/features/auth_feature/domain/entities/user_entity.dart';
import 'package:ecommerceapp/features/auth_feature/domain/repos/auth_repo.dart';
import 'package:ecommerceapp/utils/errors/exeptions.dart';
import 'package:ecommerceapp/utils/errors/falures.dart';
import 'package:ecommerceapp/utils/services/fire_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  FireAuthService fireAuthService;

  AuthRepoImpl({required this.fireAuthService});

  @override
  Future<Either<Falure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password , String name) async {
    try {
      var user = await fireAuthService.createUserWithEmailAndPassword(
          email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
    catch (e) {
      log('Exeption in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Falure, UserEntity>> signInWithEmailAndPassword(
      String email, String password ) async {
    try {
      var user = await fireAuthService.signInWithEmailAndPassword(
          email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
    catch (e) {
      log('Exeption in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Falure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await fireAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
    catch (e) {
      log('Exeption in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Falure, UserEntity>> signInWithFacebook() async{
    try {
      var user = await fireAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
    catch (e) {
      log('Exeption in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(e.toString()));
    }

  }


}
