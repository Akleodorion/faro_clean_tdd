import '../repositories/user_authentification_repository.dart';

import '../entities/user.dart';

class LogInWithToken {
  final UserAuthentificationRepository repository;

  LogInWithToken({required this.repository});

  Future<User?> call() async {
    return await repository.logInWithToken();
  }
}
