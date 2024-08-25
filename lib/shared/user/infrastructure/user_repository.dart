import '../../storage/storage.dart';
import '../../user/application/user.dart';

class UserRepository {
  UserRepository(
    this._userStorage,
  );

  final Storage<User> _userStorage;

  Future<List<User>> getAllUser() async {
    final users = await _userStorage.read();

    if (users == null) {
      return [];
    } else {
      return users;
    }
  }

  Future<List<User>> searchUser({required String nama}) async {
    final users = await _userStorage.read();
    if (users == null) {
      return [];
    }

    return users
        .where((e) => e.nama.toLowerCase().contains(nama.toLowerCase()))
        .toList();
  }

  Future<int> deleteUser({required int id}) async {
    return _userStorage.removeById(id);
  }

  Future<int> changeUserStatus({
    required User user,
    required bool status,
  }) async {
    final _user = user.copyWith(isActive: status == true ? 1 : 0);
    return _userStorage.update(_user);
  }
}
