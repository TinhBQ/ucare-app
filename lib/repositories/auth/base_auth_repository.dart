
abstract class BaseAuthRepository {
  Future<bool> signin ({
    required String phoneNumber,
    required String password,
  });
  Future<bool> signup ({
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  });
  Future<bool> confirmRegister ({
    required String code,
  });

  Future<bool> isLoggined ();
  Future<void> signOut();
}