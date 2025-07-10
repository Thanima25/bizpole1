import '../../domain/entities/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String username, String password) async {
    final userModel = await remoteDataSource.login(username, password);
    return User(username: userModel.username, token: userModel.token);
  }

  @override
  Future<User> signup(String username, String password) async {
    final userModel = await remoteDataSource.signup(username, password);
    return User(username: userModel.username, token: userModel.token);
  }
}
