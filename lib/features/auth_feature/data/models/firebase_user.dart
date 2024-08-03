import 'package:ecommerceapp/features/auth_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email,
    required super.name,
    required super.uId});

  factory UserModel.fromFirebaseUser(user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
    );
  }
}
