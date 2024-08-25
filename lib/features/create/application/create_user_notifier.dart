import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/user/application/user_notifier.dart';
import '../infrastructure/create_user_repository.dart';
import 'create_user_state.dart';

part 'create_user_notifier.g.dart';

@Riverpod(keepAlive: true)
CreateUserRepository createUserRepository(CreateUserRepositoryRef ref) {
  return CreateUserRepository(
    ref.watch(userStorageProvider),
  );
}

@riverpod
class CreateUserNotifier extends _$CreateUserNotifier {
  @override
  FutureOr<CreateUserState> build() async {
    return CreateUserState.initial();
  }

  Future<void> create({
    required String nama,
    required String email,
    required String password,
    required bool isAdmin,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(createUserRepositoryProvider).create(
            nama: nama,
            email: email,
            password: password,
            isAdmin: isAdmin,
            isActive: false,
          );

      return response.fold(
        CreateUserState.failure,
        (_) => CreateUserState.success(),
      );
    });
  }
}
