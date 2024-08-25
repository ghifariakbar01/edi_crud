import 'dart:developer';

import 'package:collection/collection.dart';

import '../../../../shared/storage/storage.dart';

import '../application/detail_profile.dart';

class DetailRepository {
  DetailRepository(
    this._detailStorage,
  );

  final Storage<DetailProfile> _detailStorage;

  Future<int> update({
    required int id,
    required String posisi,
    required String dob,
    required String noKtp,
    required int jenisKelamin,
  }) async {
    final detail = DetailProfile(
        id: id,
        posisi: posisi,
        dob: dob,
        noKtp: noKtp,
        jenisKelamin: jenisKelamin);

    return _save(detail);
  }

  Future<int> _save(DetailProfile detailNew) async {
    final _getUser = await getUserDetailBy(id: detailNew.id);

    if (_getUser == DetailProfile.initial()) {
      try {
        final save = await _detailStorage.save(detailNew);
        return save;
      } catch (err) {
        log('err $err');
        rethrow;
      }
    } else {
      try {
        final update = await _detailStorage.update(detailNew);
        return update;
      } catch (err) {
        log('err $err');
        rethrow;
      }
    }
  }

  Future<DetailProfile> getUserDetailBy({required int id}) async {
    final detail = await _detailStorage.read();
    if (detail == null) {
      return DetailProfile.initial();
    }

    final _detail = detail.firstWhereOrNull((e) => e.id == id);
    if (_detail == null) {
      return DetailProfile.initial();
    }

    return _detail;
  }
}
