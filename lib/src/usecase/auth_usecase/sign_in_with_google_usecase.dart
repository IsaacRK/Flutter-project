import 'package:firebase_auth/firebase_auth.dart';
import 'package:vanilla/src/domain/repo/auth_repo.dart';

class SignInWithGoogleUsecase {
  final AuthRepository repository;

  const SignInWithGoogleUsecase({required this.repository});

  Future<User?> call() async => await repository.signInWithGoogle();
}
