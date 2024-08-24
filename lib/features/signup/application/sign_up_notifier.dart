import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/auth/application/auth_notifier.dart';
import 'states/sign_up_state.dart';

part 'sign_up_notifier.g.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  FutureOr<SignUpState> build() async {
    return SignUpState.initial();
  }

  Future<void> signUp({
    required String nama,
    required String email,
    required String password,
    required bool isAdmin,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(authRepositoryProvider).signUp(
            nama: nama,
            email: email,
            password: password,
            isAdmin: isAdmin,
            isActive: false,
          );

      return response.fold(
        SignUpState.failure,
        (_) => SignUpState.success(),
      );
    });
  }
}
