import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'detail_profile_notifier.dart';

part 'detail_profile_controller.g.dart';

@riverpod
class DetailProfileController extends _$DetailProfileController {
  @override
  FutureOr<int> build() async {
    return 0;
  }

  Future<void> updateDetail({
    required int id,
    required String posisi,
    required String dob,
    required String noKtp,
    required int jenisKelamin,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return ref.read(detailProfileRepositoryProvider).update(
          id: id,
          posisi: posisi,
          dob: dob,
          noKtp: noKtp,
          jenisKelamin: jenisKelamin);
    });
  }
}
