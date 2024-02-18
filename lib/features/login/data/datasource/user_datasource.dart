import 'package:crypto/core/third_party_package/firebase/firebase_repository.dart';
import 'package:crypto/features/login/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthDataSourceRepository {
  Future<Either<String, UserModel>> login(
      {required String email, required String password});
}

class AuthDataSourceFirebaseProvider implements AuthDataSourceRepository {
  final FirebaseClient _firebaseClient;
  AuthDataSourceFirebaseProvider(this._firebaseClient);
  @override
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await _firebaseClient.signIn(
        email: email,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
