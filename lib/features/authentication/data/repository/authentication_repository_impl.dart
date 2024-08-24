import 'package:medhub/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:medhub/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  const AuthenticationRepositoryImpl(this._authenticationDataSource);

  @override
  Future<void> authenticateUser({String? username}) async {
    await _authenticationDataSource.authenticateUser(username: username);
  }

  @override
  String? getUser() {
    return _authenticationDataSource.getUser();
  }
}
