abstract class AuthenticationRepository {
  Future<void> authenticateUser({String? username});

  String? getUser();
}
