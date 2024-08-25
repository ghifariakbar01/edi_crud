import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user.dart';
import 'user_notifier.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<int> build() async {
    return 0;
  }

  Future<void> deleteUser({required int id}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return ref.read(userRepositoryProvider).deleteUser(id: id);
    });
  }

  Future<void> changeUserStatus({
    required User user,
    required bool status,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return ref.read(userRepositoryProvider).changeUserStatus(
            user: user,
            status: status,
          );
    });
  }
}
