import 'package:medhub/core/usecase/usecase.dart';
import 'package:medhub/features/authentication/domain/repository/authentication_repository.dart';

class GetUserUseCase implements UseCase<String?, Null> {
  final AuthenticationRepository authenticationRepository;

  const GetUserUseCase(this.authenticationRepository);

  @override
  Future<String?> call({Null params}) async {
    return authenticationRepository.getUser();
  }
}
