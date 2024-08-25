import 'package:edi_crud/shared/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../infrastructure/user_repository.dart';
import '../infrastructure/user_storage.dart';
import 'user.dart';

part 'user_notifier.g.dart';

@Riverpod(keepAlive: true)
UserStorage userStorage(UserStorageRef ref) {
  return UserStorage(
    ref.watch(sqfliteDatabaseProvider.future),
  );
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(
    ref.watch(userStorageProvider),
  );
}

@riverpod
class UsersNotifier extends _$UsersNotifier {
  @override
  FutureOr<List<User>> build() async {
    return ref.read(userRepositoryProvider).getAllUser();
  }

  Future<void> getAllUser() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() {
      return ref.read(userRepositoryProvider).getAllUser();
    });
  }

  Future<void> searchUser({required String nama}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return ref.read(userRepositoryProvider).searchUser(nama: nama);
    });
  }
}
