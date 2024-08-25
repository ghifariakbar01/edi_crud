import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

import '../../../features/signin/application/states/sign_in_failure.dart';
import '../../../features/signup/application/states/sign_up_failure.dart';
import '../../storage/storage.dart';
import '../../user/application/user.dart';

class AuthRepository {
  AuthRepository(
    this._authStorage,
    this._userStorage,
  );

  final Storage<User> _authStorage;
  final Storage<User> _userStorage;

  Future<bool> isSignedIn() => _getSignedInData().then(
        (credentials) => credentials != null,
      );

  Future<int> signOut() async {
    return _authStorage.clear();
  }

  Future<Either<SignUpFailure, Unit>> signUp({
    required String nama,
    required String email,
    required String password,
    required bool isActive,
    required bool isAdmin,
  }) async {
    final userDb = await _getUserBy(
      nama: nama,
      password: password,
    );

    if (userDb != null) {
      return left(SignUpFailure.alreadyExist());
    }

    final user = User(
        id: 0,
        nama: nama,
        email: email,
        password: password,
        isActive: isActive == true ? 1 : 0,
        isAdmin: isAdmin == true ? 1 : 0);

    try {
      await _save(user);
    } catch (err) {
      log('err $err');
      return left(SignUpFailure.storage());
    }

    try {
      await _saveToUserDb(user);
    } catch (err) {
      log('err $err');
      return left(SignUpFailure.storage());
    }

    return right(unit);
  }

  Future<Either<SignInFailure, Unit>> signIn({
    required String nama,
    required String password,
  }) async {
    final userDb = await _getUserBy(
      nama: nama,
      password: password,
    );

    if (userDb != null) {
      try {
        await _save(userDb);
      } catch (err) {
        log('err $err');
        return left(SignInFailure.storage());
      }

      return right(unit);
    } else {
      return left(SignInFailure.notFound());
    }
  }

  Future<int> _save(User user) async {
    return _authStorage.save(user);
  }

  Future<int> _saveToUserDb(User user) async {
    return _userStorage.save(user);
  }

  Future<User?> _getUserBy({
    required String nama,
    required String password,
  }) async {
    final user = await _userStorage.read();
    if (user == null) {
      return null;
    }

    if (user.length == 0) {
      return null;
    }

    final item = user.firstWhereOrNull((e) =>
        e.nama.toLowerCase() == nama.toLowerCase() &&
        e.password.toLowerCase() == password.toLowerCase());

    if (item == null) {
      return null;
    }

    return item;
  }

  Future<User?> _getSignedInData() async {
    final user = await _authStorage.read();

    if (user == null) {
      return null;
    }

    if (user.length > 1 || user.length == 0) {
      return null;
    }

    final item = user.first;

    return item;
  }
}
