import 'package:crypto/features/login/domain/entity/user.dart';
import 'package:crypto/features/login/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Auth {
  final AuthRepository authRepository;

  Auth(this.authRepository);

  Future<Either<String, User>> call(
      {required String email, required String password}) async {
    return authRepository.login(email: email, password: password);
  }
}
