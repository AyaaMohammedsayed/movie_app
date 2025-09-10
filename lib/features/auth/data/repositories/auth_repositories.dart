import 'package:movie_app/features/auth/data/data_sourses/local/auth_local_data_sourse.dart';
import 'package:movie_app/features/auth/data/data_sourses/local/auth_shared_pref_local_data_sourse.dart';
import 'package:movie_app/features/auth/data/data_sourses/remote/auth_api_remote_data_sourse.dart';
import 'package:movie_app/features/auth/data/data_sourses/remote/auth_remote_data_sourse.dart';
import 'package:movie_app/features/auth/data/models/login_requeest.dart';
import 'package:movie_app/features/auth/data/models/register_reguest.dart';
import 'package:movie_app/features/auth/data/models/user_model.dart';

class AuthRepositories {
  final AuthRemoteDataSourse _remoteDataSourse = AuthApiRemoteDataSourse();
  final AuthLocalDataSourse _LocalDataSourse = AuthSharedPrefLocalDataSourse();

  Future<UserModel> register(RegisterReguest request) async {
    final response = await _remoteDataSourse.register(request);
    await _LocalDataSourse.saveToken(response.token);
    return response.user;
  }

  Future<UserModel> login(LoginRequeest request) async {
    final response = await _remoteDataSourse.login(request);
    await _LocalDataSourse.saveToken(response.token);
    return response.user;
  }
}
