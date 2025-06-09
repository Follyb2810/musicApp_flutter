import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';


//? dart run build_runner watch -d


part 'auth_local_repository.g.dart';

// @riverpod    //? new instance spawn up
@Riverpod(keepAlive: true) //? use this to keep alive
AuthLocalRepository authLocalRepository(Ref ref) {
  return AuthLocalRepository();
}

class AuthLocalRepository {
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setToken(String? token) {
    if (token != null) {
      _sharedPreferences.setString('x-auth-token', token);
    }
  }

  String? getToken([String token = 'x-auth-token']) {
    return _sharedPreferences.getString(token);
  }
}
