import '../../storage/storage.dart';
import 'package:sqflite/sqflite.dart';

import '../application/user.dart';

class UserStorage implements Storage<User> {
  UserStorage(this._db);

  final Future<Database> _db;

  static const _key = 'auth_db.db';
  static const _tableName = 'TM_PEGAWAI';

  @override
  Future<int> clear() async {
    final db = await _db;
    return db.delete(_tableName);
  }

  @override
  Future<int> removeById(int id) async {
    final db = await _db;
    return db.delete(_tableName, where: 'id = $id');
  }

  @override
  Future<List<User>?> read() async {
    final db = await _db;

    try {
      final storedCredentials = await db.query(_tableName);

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
    } on DatabaseException {
      return [];
    }
  }

  @override
  Future<int> save(User user) async {
    final db = await _db;
    final users = await read();

    if (users == null) {
      return db.insert(
        _tableName,
        user.copyWith(id: 1).toJson(),
      );
    } else {
      return db.insert(
        _tableName,
        user.copyWith(id: users.last.id + 1).toJson(),
      );
    }
  }

  @override
  Future<int> update(User user) async {
    final db = await _db;

    return db.update(
      _tableName,
      user.toJson(),
      where: 'id = ${user.id}',
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
}
