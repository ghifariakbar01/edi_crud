import 'package:sqflite/sqflite.dart';

abstract class Storage<T> {
  Future<int> clear();

  Future<int> removeById(int id);

  Future<List<T>?> read();

  Future<int> save(T json);

  Future<Database> open();

  Future<int> getLastId();
}
