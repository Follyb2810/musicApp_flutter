import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart' as fp;

import 'package:musicapp/core/coonstant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:musicapp/core/failure/app_failure.dart';
import 'package:musicapp/feature/auth/model/user_model.dart';
import 'package:musicapp/feature/auth/model/data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref){
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  static String uri = '${Constant.serverUrl}/User';
  // static const String url = "http://127.0.0.1:5028/api/User/signup";

  Future<fp.Either<AppFailure, UserModel>> signUp({
    // Future<fp.Either<AppFailure,Map<String, dynamic>>> signUp({
    required String email,
    required String userName,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/signup'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "userName": userName,
          "password": password,
        }),
      );


      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final errMsg = decoded['message'];
      if (response.statusCode != 200 && response.statusCode != 201) {
        final errorMessage = errMsg ?? 'Unexpected error';
        return fp.Left(
          AppFailure(
            message: errorMessage,
            statusCode: response.statusCode,
            data: decoded,
          ),
        );
      }

      return fp.Right(
        UserModel(
          user: DataModel.fromJson(decoded['data']),
          statusCode: response.statusCode,
          message: errMsg,
        ),
      );
      // return fp.Right(decoded['data']);
    } catch (e) {
      // return fp.Left(AppFailure(message: e.toString()));
      return fp.Left(AppFailure(message: e.toString()));
    } finally {
    }
  }

  Future<fp.Either<AppFailure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final errMsg = decoded['message'];
      if (response.statusCode != 200 && response.statusCode != 201) {
        final errorMessage = errMsg ?? 'Unexpected error';
        return fp.Left(
          AppFailure(
            message: errorMessage,
            statusCode: response.statusCode,
            data: decoded['data'],
          ),
        );
      }
      return fp.Right(
        UserModel(
          user: DataModel.fromJson(decoded['data']),
          statusCode: response.statusCode,
          message: errMsg,
        ),
      );
      // return fp.Right(decoded['data']);
    } catch (e) {
      // return fp.Left(AppFailure(message: e.toString()));
      return fp.Left(AppFailure(message: e.toString()));
    } finally {
    }
  }
  Future<fp.Either<AppFailure, UserModel>> getCurrentUser(String token) async {
  try {
    final response = await http.get(
      Uri.parse('$uri/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final errMsg = decoded['message'];

    if (response.statusCode != 200 && response.statusCode != 201) {
      final errorMessage = errMsg ?? 'Unexpected error';
      return fp.Left(
        AppFailure(
          message: errorMessage,
          statusCode: response.statusCode,
          data: decoded['data'],
        ),
      );
    }

    return fp.Right(
      UserModel(
        user: DataModel.fromJson(decoded['data']),
        statusCode: response.statusCode,
        message: errMsg,
      ),
    );
  } catch (e) {
    return fp.Left(AppFailure(message: e.toString()));
  }
}




}
