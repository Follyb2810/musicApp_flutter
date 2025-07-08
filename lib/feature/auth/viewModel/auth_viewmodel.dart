// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/core/failure/app_failure.dart';
import 'package:musicapp/core/providers/current_user_notiifier.dart';
import 'package:musicapp/feature/auth/model/user_model.dart';
import 'package:musicapp/feature/auth/repositories/auth_local_repository.dart';
import 'package:musicapp/feature/auth/repositories/auth_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart' as fp;

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;
  late AuthLocalRepository _authLocalRepository;
  late CurrentUserNotiifier _currentUserNotifier;
  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _authLocalRepository = ref.watch(authLocalRepositoryProvider);
    _currentUserNotifier = ref.watch(currentUserNotiifierProvider.notifier);
    return null;
  }

  Future<void> initSharedPreference() async {
    await _authLocalRepository.init();
  }

  Future<void> signUpUser({
    required String email,
    required String name,
    required String password,
  }) async {
    state = AsyncValue.loading();
    final response = await _authRemoteRepository.signUp(
      email: email,
      userName: name,
      password: password,
    );
    final val = switch (response) {
      fp.Left(value: final l) => state = AsyncValue.error(
        l.message,
        StackTrace.current,
      ),
      fp.Right(value: final r) => state = AsyncValue.data(r),
    };

    print(val);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = AsyncValue.loading();
    final response = await AuthRemoteRepository().signIn(
      email: email,
      password: password,
    );
    final val = switch (response) {
      fp.Left(value: final l) => _getError(l),
      //  state = AsyncValue.error(
      //   l.message,
      //   StackTrace.current,
      // ),
      fp.Right(value: final r) => _loginSucces(r),
      // fp.Right(value: final r) => state = AsyncValue.data(r),
    };

    print('this is the last $val');
  }

  Future<void> logoutUser() async {
    final success = await _authLocalRepository.removeToken();

    if (success) {
      _currentUserNotifier.clearUser();
      // state = const AsyncValue.data(null);
      print("User successfully logged out.");
    } else {
      print("Failed to remove token.");
    }
  }

  Future _getError(AppFailure l) async {
    await _authLocalRepository.removeToken();
    state = AsyncValue.error(l.message, StackTrace.current);
  }

  AsyncValue<UserModel>? _loginSucces(UserModel usermodel) {
    _authLocalRepository.setToken(usermodel.user.token);
    _currentUserNotifier.addUser(usermodel);
    return state = AsyncValue.data(usermodel);
  }

  Future<UserModel?> getData() async {
    state = AsyncValue.loading();
    final token = await _authLocalRepository.getToken();
    print("Fetched token: $token");

    if (token != null && token.isNotEmpty) {
      final response = await _authRemoteRepository.getCurrentUser(token);

      final val = switch (response) {
        fp.Left(value: final l) => state = AsyncValue.error(
          l.message,
          StackTrace.current,
        ),

        fp.Right(value: final r) => _getDataSuccess(r),
      };

      return val.value;
    }

    print("Token is null or empty.");
    return null;
  }

  AsyncValue<UserModel> _getDataSuccess(UserModel user) {
    _currentUserNotifier.addUser(user);
    return state = AsyncValue.data(user);
  }
}
// class Counter extends StateNotifier<int> {
//   Counter() : super(0);

//   void increment() => state++;
//   void decrement() => state--;
// }

// class AuthViewmodel extends Notifier {
//   @override
//   build() {
//     throw UnimplementedError();
//   }
// }
