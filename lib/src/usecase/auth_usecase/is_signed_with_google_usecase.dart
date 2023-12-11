import 'package:vanilla/src/domain/repo/auth_repo.dart';

class IsSignedInWithGoogleUsecase {
  final AuthRepository repository;

  const IsSignedInWithGoogleUsecase({required this.repository});

  bool call() => repository.isSignedInWithGoogle();
}
