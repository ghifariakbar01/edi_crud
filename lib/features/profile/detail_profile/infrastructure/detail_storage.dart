import 'package:sqflite/sqflite.dart';

import '../../../../shared/storage/storage.dart';
import '../application/detail_profile.dart';

class DetailProfileStorage implements Storage<DetailProfile> {
  DetailProfileStorage(this._db);

  final Future<Database> _db;

  static const _key = 'auth_db.db';
  static const _tableName = 'TM_PEGAWAI_DETAIL';

  @override
  Future<int> removeById(int id) async {
    final db = await _db;
    return db.delete(_tableName, where: 'id = $id');
  }

  @override
  Future<int> clear() async {
    final db = await _db;
    return db.delete(_tableName);
  }

  @override
  Future<List<DetailProfile>?> read() async {
    final db = await _db;

    try {
      final storedCredentials = await db.query(_tableName);

      if (storedCredentials.isEmpty) {
        return null;
      }

      try {
        final list = storedCredentials
            .map((e) => DetailProfile.fromJson(e as Map<String, dynamic>))
            .toList();

        return list;
      } on FormatException {
        return null;
      }
    } on DatabaseException {
      await db.execute(
          'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, posisi TEXT, dob TEXT, no_ktp TEXT, jenis_kelamin INTEGER)');
      return read();
    }
  }

  @override
  Future<int> save(DetailProfile detail) async {
    final db = await _db;
    final details = await read();

    if (details == null) {
      return db.insert(
        _tableName,
        detail.copyWith(id: 1).toJson(),
      );
    } else {
      return db.insert(
        _tableName,
        detail.copyWith(id: details.last.id + 1).toJson(),
      );
    }
  }

  @override
  Future<int> update(DetailProfile detail) async {
    final db = await _db;

    return db.update(
      _tableName,
      detail.toJson(),
      where: 'id = ${detail.id}',
    );
  }

  @override
  open() async {
    return openDatabase(
      _key,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, posisi TEXT, dob TEXT, no_ktp TEXT, jenis_kelamin INTEGER)');
      },
    );
  }
}
