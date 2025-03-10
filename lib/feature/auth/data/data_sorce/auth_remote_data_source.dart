import 'package:firebase_auth/firebase_auth.dart';
import 'package:games/feature/auth/data/models/user_model.dart';

abstract interface class FirebaseAuthRemoteDataSource {
  Future<UserModel> signUp(String email, String password);
  Future<UserModel> login(String email, String password);
  Future<void> logOut();
}

class FireBaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> login(String email, String password) async {
    final UserCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserModel(
        id: UserCredential.user!.uid,
        email: UserCredential.user!.email ?? '',
        name: UserCredential.user!.displayName ?? '');
  }

  @override
  Future<UserModel> signUp(String email, String password) async {
    final UserCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserModel(
      id: UserCredential.user!.uid,
      email: UserCredential.user!.email ?? '',
      name: UserCredential.user!.displayName ?? '',
    );
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
