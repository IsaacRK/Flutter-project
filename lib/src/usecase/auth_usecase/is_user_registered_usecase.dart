import 'package:vanilla/src/domain/repo/auth_repo.dart';

class IsUserRegisteredUsecase {
  final AuthRepository repository;

  const IsUserRegisteredUsecase({required this.repository});

  Future<bool> call() async => await repository.isUserRegistered();
}
