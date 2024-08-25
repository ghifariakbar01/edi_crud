import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/auth/application/auth_notifier.dart';
import 'states/sign_in_state.dart';

part 'sign_in_notifier.g.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  FutureOr<SignInState> build() async {
    return SignInState.initial();
  }

  Future<void> signIn({
    required String nama,
    required String password,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(authRepositoryProvider).signIn(
            nama: nama,
            password: password,
          );

      return response.fold(
        SignInState.failure,
        (_) => SignInState.success(),
      );
    });
  }
}
