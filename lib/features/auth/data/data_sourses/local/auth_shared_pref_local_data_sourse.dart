import 'package:movie_app/core/constants/constant_api.dart';
import 'package:movie_app/features/auth/data/data_sourses/local/auth_local_data_sourse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSourse implements AuthLocalDataSourse {
  @override
  Future<String> getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(ConstantAPI.tokenKey)!;
  }

  @override
  Future<void> saveToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(ConstantAPI.tokenKey, token);
  }
}
