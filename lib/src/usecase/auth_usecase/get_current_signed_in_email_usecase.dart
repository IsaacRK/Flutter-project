import 'package:vanilla/src/domain/repo/auth_repo.dart';

class GetCurrentSignedInEmailUsecase {
  final AuthRepository repository;

  const GetCurrentSignedInEmailUsecase({required this.repository});

  String? call() => repository.getCurrentSignedInEmail();
}
