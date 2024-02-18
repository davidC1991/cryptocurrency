import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/features/login/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseClient {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
  Future<UserModel> createUser({
    required String email,
    required String password,
  });
  Future<void> update({
    required String mainCollection,
    required String userId,
    required Map<Object, Object?> data,
  });
  Future<void> set({
    required String mainCollection,
    required String userId,
    required Map<String, dynamic> data,
  });
  Future<DocumentSnapshot<Map<String, dynamic>>> getAllByUser({
    required String userId,
    required String mainCollection,
  });
}

class FirebaseAsProvider implements FirebaseClient {
  @override
  Future<UserModel> createUser({
    required String email,
    required String password,
  }) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final String userId = credential.user?.uid ?? '';
    FirebaseFirestore.instance.collection('users').doc(userId).set({
      'email': email,
      'password': password,
      'userId': userId,
    });
    return UserModel(
      name: 'Any',
      email: email,
      userId: credential.user?.uid ?? '',
    );
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getAllByUser(
      {required String userId, required String mainCollection}) async {
    return await FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(userId)
        .get();
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(
      name: 'Any',
      email: email,
      userId: credential.user?.uid ?? '',
    );
  }

  @override
  Future<void> update({
    required String mainCollection,
    required String userId,
    required Map<Object, Object?> data,
  }) async {
    await FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(userId)
        .update(data);
    return;
  }

  @override
  Future<void> set({
    required String mainCollection,
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(userId)
        .set(data);
    return;
  }
}
