import '../../storage/storage.dart';
import 'package:sqflite/sqflite.dart';

import '../application/user.dart';

class UserStorage implements Storage<User> {
  UserStorage();

  static const _key = 'auth_db.db';
  static const _tableName = 'TM_PEGAWAI';

  @override
  Future<int> clear() async {
    Database _db = await open();

    return _db.delete(_tableName);
  }

  @override
  Future<int> removeById(int id) async {
    Database _db = await open();

    return _db.delete(_tableName, where: 'id = $id');
  }

  @override
  Future<List<User>?> read() async {
    Database _db = await open();

    final storedCredentials = await _db.query(_tableName);

    if (storedCredentials.isEmpty) {
      return null;
    }

    try {
      final list = storedCredentials
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();

      return list;
    } on FormatException {
      return null;
    }
  }

  @override
  Future<int> save(User user) async {
    Database _db = await open();
    final _id = await getLastId();

    return _db.insert(
      _tableName,
      user.copyWith(id: _id).toJson(),
    );
  }

  @override
  open() async {
    return openDatabase(
      _key,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama TEXT, email TEXT, password TEXT, is_active INTEGER, is_admin INTEGER)');
      },
    );
  }

  @override
  getLastId() async {
    final db = await open();

    final query = await db.query(_tableName, orderBy: 'id');

    if (query.isEmpty) {
      return 1;
    } else {
      return (query.first as int);
    }
  }
}
