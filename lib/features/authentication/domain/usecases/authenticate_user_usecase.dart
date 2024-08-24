import 'package:medhub/core/usecase/usecase.dart';
import 'package:medhub/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticateUserUseCase implements UseCase<void, String?> {
  final AuthenticationRepository authenticationRepository;

  const AuthenticateUserUseCase(this.authenticationRepository);

  @override
  Future<void> call({String? params}) async {
    return await authenticationRepository.authenticateUser(username: params);
  }
}
