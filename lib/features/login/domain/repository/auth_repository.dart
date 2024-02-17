import 'package:crypto/features/login/domain/entity/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, User>> login(
      {required String email, required String password});
}
