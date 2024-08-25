import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/providers/providers.dart';
import '../infrastructure/detail_repository.dart';
import '../infrastructure/detail_storage.dart';
import 'detail_profile.dart';

part 'detail_profile_notifier.g.dart';

@Riverpod(keepAlive: true)
DetailProfileStorage detailProfileStorage(DetailProfileStorageRef ref) {
  return DetailProfileStorage(
    ref.watch(sqfliteDatabaseProvider.future),
  );
}

@Riverpod(keepAlive: true)
DetailRepository detailProfileRepository(DetailProfileRepositoryRef ref) {
  return DetailRepository(
    ref.watch(detailProfileStorageProvider),
  );
}

@riverpod
class DetailProfileNotifier extends _$DetailProfileNotifier {
  @override
  FutureOr<DetailProfile> build() async {
    return DetailProfile.initial();
  }

  Future<void> getUserDetailBy({required int id}) async {
    state = await AsyncValue.guard(() async {
      return ref.read(detailProfileRepositoryProvider).getUserDetailBy(id: id);
    });
  }
}
