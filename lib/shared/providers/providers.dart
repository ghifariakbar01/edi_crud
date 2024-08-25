import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../routes/route_notifier.dart';

part 'providers.g.dart';

final routerProvider = StateProvider<GoRouter>((ref) {
  final router = RouterNotifier();
  return GoRouter(
    refreshListenable: router,
    redirect: router.redirectLogic,
    routes: router.routes,
  );
});

final router = RouterNotifier();

final signedInRouter = GoRouter(
  refreshListenable: router,
  routes: router.routes,
  redirect: router.onAuthenticated,
);

final initialRouter = GoRouter(
  refreshListenable: router,
  routes: router.routes,
  redirect: router.redirectLogic,
);

@Riverpod(keepAlive: true)
class SqfliteDatabase extends _$SqfliteDatabase {
  @override
  FutureOr<Database> build() async {
    const _key = 'auth_db.db';
    const _tableName1 = 'TM_USER';
    const _tableName2 = 'TM_PEGAWAI';
    const _tableName3 = 'TM_PEGAWAI_DETAIL';

    final db = await openDatabase(
      _key,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $_tableName1 (id INTEGER PRIMARY KEY, nama TEXT, email TEXT, password TEXT, is_active INTEGER, is_admin INTEGER)');
        await db.execute(
            'CREATE TABLE $_tableName2 (id INTEGER PRIMARY KEY, nama TEXT, email TEXT, password TEXT, is_active INTEGER, is_admin INTEGER)');
        await db.execute(
            'CREATE TABLE $_tableName3 (id INTEGER PRIMARY KEY, posisi TEXT, dob TEXT, no_ktp TEXT, jenis_kelamin INTEGER)');
      },
    );

    return db;
  }
}
