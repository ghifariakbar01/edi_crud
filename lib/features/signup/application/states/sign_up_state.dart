import 'package:freezed_annotation/freezed_annotation.dart';

import 'sign_up_failure.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState.initial() = _Initial;
  factory SignUpState.success() = _Success;
  factory SignUpState.failure(SignUpFailure failure) = _Failure;
}
