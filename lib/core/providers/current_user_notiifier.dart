import 'package:musicapp/feature/auth/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notiifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotiifier extends _$CurrentUserNotiifier {
  @override
  UserModel? build() {
    return null;
  }

  void addUser(UserModel user) {
    state = user;
  }
}
