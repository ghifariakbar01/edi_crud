import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

import '../../../shared/storage/storage.dart';
import '../../../shared/user/application/user.dart';
import '../application/create_user_failure.dart';

class CreateUserRepository {
  CreateUserRepository(
    this._userStorage,
  );

  final Storage<User> _userStorage;

  Future<Either<CreateUserFailure, Unit>> create({
    required String nama,
    required String email,
    required String password,
    required bool isActive,
    required bool isAdmin,
  }) async {
    final userDb = await _getUserBy(
      nama: nama,
      email: email,
      password: password,
    );

    if (userDb != null) {
      return left(CreateUserFailure.alreadyExist());
    }

    final user = User(
        id: 0,
        nama: nama,
        email: email,
        password: password,
        isActive: isActive == true ? 1 : 0,
        isAdmin: isAdmin == true ? 1 : 0);

    try {
      await _saveToUserDb(user);
    } catch (err) {
      return left(CreateUserFailure.storage(err.toString()));
    }

    return right(unit);
  }

  Future<int> _saveToUserDb(User user) async {
    return _userStorage.save(user);
  }

  Future<User?> _getUserBy({
    required String nama,
    required String password,
    required String email,
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
        e.password.toLowerCase() == password.toLowerCase() &&
        e.email.toLowerCase() == email.toLowerCase());

    if (item == null) {
      return null;
    }

    return item;
  }
}
