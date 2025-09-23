abstract class AuthLocalDataSourse {
  Future<void> saveToken(String token);

  Future<String> getToken();
}
