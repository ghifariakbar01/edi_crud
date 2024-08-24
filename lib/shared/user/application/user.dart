import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    required String nama,
    required String password,
    required String email,
    @JsonKey(name: 'is_active') required int isActive,
    @JsonKey(name: 'is_admin') required int isAdmin,
  }) = _User;

  factory User.initial() => User(
        id: 0,
        nama: '',
        password: '',
        email: '',
        isActive: 0,
        isAdmin: 0,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
