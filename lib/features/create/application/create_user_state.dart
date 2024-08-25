import 'package:freezed_annotation/freezed_annotation.dart';

import 'create_user_failure.dart';

part 'create_user_state.freezed.dart';

@freezed
class CreateUserState with _$CreateUserState {
  factory CreateUserState.initial() = _Initial;
  factory CreateUserState.success() = _Success;
  factory CreateUserState.failure(CreateUserFailure failure) = _Failure;
}
