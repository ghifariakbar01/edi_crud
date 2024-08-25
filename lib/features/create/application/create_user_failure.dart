import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_failure.freezed.dart';

@freezed
class CreateUserFailure with _$CreateUserFailure {
  factory CreateUserFailure.alreadyExist() = _AlreadyExist;
  factory CreateUserFailure.storage(String message) = _Storage;
}
