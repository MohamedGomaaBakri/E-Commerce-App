import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/features/auth_feature/domain/entities/user_entity.dart';
import 'package:ecommerceapp/utils/errors/falures.dart';

abstract class AuthRepo {
  Future<Either<Falure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password , String name);

  Future<Either<Falure, UserEntity>> signInWithEmailAndPassword(
      String email, String password );

  Future<Either<Falure, UserEntity>> signInWithGoogle();

  Future<Either<Falure, UserEntity>> signInWithFacebook();
}
