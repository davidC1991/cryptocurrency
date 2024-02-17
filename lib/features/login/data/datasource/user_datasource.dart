import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/core/firestore_controller/firestore_instances.dart';
import 'package:crypto/features/login/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSourceRepository {
  Future<Either<String, UserModel>> login(
      {required String email, required String password});
}

class AuthDataSourceFirebaseProvider implements AuthDataSourceRepository {
  @override
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel(
        name: 'Test',
        email: email,
        userId: credential.user?.uid ?? '',
      ));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<UserCredential> _createUser(String email, String password) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final String userId = credential.user?.uid ?? '';
    FireStoreInstance.users.doc(userId).set({
      'email': email,
      'password': password,
      'userId': userId,
    });
    return credential;
  }

  Future<bool> _isExistingEmail(String email) async {
    final QuerySnapshot<Map<String, dynamic>> data =
        await FireStoreInstance.users.get();
    final List values = data.docs[0].data().values.toList();
    return values.contains(email);
  }
}
