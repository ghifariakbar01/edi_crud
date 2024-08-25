import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_failure.freezed.dart';

@freezed
class CreateUserFailure with _$CreateUserFailure {
  factory CreateUserFailure.storage() = _Storage;
  factory CreateUserFailure.alreadyExist() = _AlreadyExist;
}
