import '../entities/user.dart';
import '../repository/auth_repository.dart';

class SignupUser {
  final AuthRepository repository;

  SignupUser(this.repository);

  Future<User> call(String username, String password) {
    return repository.signup(username, password);
  }
}
