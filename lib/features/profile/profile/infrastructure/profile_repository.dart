import '../../../../shared/storage/storage.dart';
import '../../../../shared/user/application/user.dart';

class ProfileRepository {
  ProfileRepository(
    this._authStorage,
  );

  final Storage<User> _authStorage;

  Future<User> getSignedInUser() async {
    return _authStorage
        .read()
        .then((value) => value == null ? User.initial() : value.first);
  }
}
