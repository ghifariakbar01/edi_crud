import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

import '../../../features/signin/application/states/sign_in_failure.dart';
import '../../../features/signup/application/states/sign_up_failure.dart';
import '../../storage/storage.dart';
import '../../user/application/user.dart';

class AuthRepository {
  AuthRepository(
    this._credentialsStorage,
  );

  final Storage<User> _credentialsStorage;

  Future<bool> isSignedIn() => _getSignedInData().then(
        (credentials) => credentials != null,
      );

  Future<int> signOut() async {
    final rows = _credentialsStorage.clear();

    assert(rows == 1);

    return 1;
  }

  Future<Either<SignUpFailure, Unit>> signUp({
    required String nama,
    required String email,
    required String password,
    required bool isActive,
    required bool isAdmin,
  }) async {
    final isUserExist = await _isUserExist(
      nama: nama,
      email: email,
      password: password,
    );

    if (isUserExist) {
      return left(SignUpFailure.alreadyExist());
    }

    try {
      await _save(
        User(
            id: 0,
            nama: nama,
            email: email,
            password: password,
            isActive: isActive == true ? 1 : 0,
            isAdmin: isAdmin == true ? 1 : 0),
      );
    } catch (err) {
      log('err $err');
      return left(SignUpFailure.storage());
    }

    return right(unit);
  }

  Future<Either<SignInFailure, Unit>> signIn({
    required String nama,
    required String email,
    required String password,
    required bool isAdmin,
  }) async {
    final isUserExist = await _isUserExist(
      nama: nama,
      email: email,
      password: password,
    );

    if (isUserExist) {
      return right(unit);
    } else {
      return left(SignInFailure.notFound());
    }
  }

  Future<int> _save(User user) async {
    return _credentialsStorage.save(user);
  }

  Future<bool> _isUserExist({
    required String nama,
    required String email,
    required String password,
  }) async {
    final users = await _credentialsStorage.read();
    if (users == null) {
      return false;
    }

    final search = users.firstWhereOrNull((e) => e.nama == nama);
    if (search == null) {
      return false;
    }

    return true;
  }

  Future<List<User>?> _getSignedInData() async {
    final users = await _credentialsStorage.read();

    if (users == null) {
      return null;
    }

    assert(users.length == 0 || users.length == 1);

    return users;
  }

  // LOGOUT
  // try {
  //   await _remoteService.signOut();
  // } on RestApiException catch (e) {
  //   return left(AuthFailure.server(e.errorCode));
  // } on NoConnectionException {
  //   // Ignoring
  // }
}
