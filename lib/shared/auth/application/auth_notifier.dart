import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../infrastructures/auth_repository.dart';
import '../infrastructures/auth_storage.dart';
import 'states/auth_state.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
AuthStorage authStorage(AuthStorageRef ref) {
  return AuthStorage();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    ref.watch(authStorageProvider),
  );
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthState> build() async {
    return AuthState.initial();
  }

  Future<void> checkAndUpdateAuthStatus() async {
    final isSignedIn = await ref.read(authRepositoryProvider).isSignedIn();

    if (isSignedIn) {
      state = const AsyncValue.data(AuthState.authenticated());
    } else {
      state = const AsyncValue.data(AuthState.unauthenticated());
    }
  }
}
