import 'package:crypto/features/login/data/datasource/user_datasource.dart';
import 'package:crypto/features/login/data/model/user_model.dart';
import 'package:crypto/features/login/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthDataSourceImpl implements AuthRepository {
  AuthDataSourceRepository authDataSourceRepository;
  AuthDataSourceImpl(this.authDataSourceRepository);

  @override
  Future<Either<String, UserModel>> login(
      {required String email, required String password}) async {
    final data =
        await authDataSourceRepository.login(email: email, password: password);
    return data;
  }
}
