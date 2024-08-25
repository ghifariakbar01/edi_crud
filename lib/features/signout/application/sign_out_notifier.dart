import 'package:edi_crud/shared/auth/application/auth_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_notifier.g.dart';

@riverpod
class SignOutNotifier extends _$SignOutNotifier {
  @override
  FutureOr<int> build() async {
    return 0;
  }

  Future<void> signOut() async {
    state = await AsyncValue.guard(() async {
      return ref.read(authRepositoryProvider).signOut();
    });
  }
}
