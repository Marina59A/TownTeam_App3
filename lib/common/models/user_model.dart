import 'package:firebase_auth/firebase_auth.dart';
import 'package:townteam_app/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    // required super.name,
    required super.email,
    // required super.surName,
    required super.password,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      // name: user.displayName ?? "",
      email: user.email ?? "",
      // surName: '',
      password: '',
    );
  }
}
