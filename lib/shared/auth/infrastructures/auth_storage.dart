import 'package:sqflite/sqflite.dart';

import '../../storage/storage.dart';
import '../../user/application/user.dart';

class AuthStorage implements Storage<User> {
  AuthStorage(this._db);

  final Future<Database> _db;

  static const _key = 'auth_db.db';
  static const _tableName = 'TM_USER';

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
    final storedCredentials = await db.query(_tableName);

    if (storedCredentials.isEmpty) {
      return null;
    }

    try {
      return [User.fromJson(storedCredentials.first as Map<String, dynamic>)];
    } on FormatException {
      return null;
    }
  }

  @override
  Future<int> save(User user) async {
    final db = await _db;
    return db.insert(
      _tableName,
      user.toJson(),
    );
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
