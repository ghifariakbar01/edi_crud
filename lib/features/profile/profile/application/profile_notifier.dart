import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/auth/application/auth_notifier.dart';
import '../../../../shared/user/application/user.dart';
import '../infrastructure/profile_repository.dart';

part 'profile_notifier.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepository(
    ref.watch(authStorageProvider),
  );
}

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  FutureOr<User> build() async {
    return ref.read(profileRepositoryProvider).getSignedInUser();
  }
}
