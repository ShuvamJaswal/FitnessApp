import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authentication_repository.g.dart';

class AuthenticationRepository {
  final FirebaseAuth fireAuth;
  AuthenticationRepository({
    required this.fireAuth,
  });
  Future<UserCredential> signInAnonymously() async {
    final UserCredential userCredential = await fireAuth.signInAnonymously();
    return userCredential;
  }
}

@riverpod
FirebaseAuth firebaseAuthInstance(FirebaseAuthInstanceRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  final auth = ref.watch(firebaseAuthInstanceProvider);
  return AuthenticationRepository(fireAuth: auth);
}
