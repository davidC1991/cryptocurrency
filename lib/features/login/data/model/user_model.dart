import 'package:crypto/features/login/domain/entity/user.dart';

UserModel userFromjson(Map<String, dynamic> json) => UserModel.fromJson(json);

class UserModel extends User {
  const UserModel({
    this.email,
    this.name,
    this.userId,
  }) : super(
          email: email,
          name: name,
          userId: userId,
        );

  final String? name;
  final String? email;
  final String? userId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel();
}
