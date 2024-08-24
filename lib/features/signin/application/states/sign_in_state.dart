import 'package:freezed_annotation/freezed_annotation.dart';

import 'sign_in_failure.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  factory SignInState.initial() = _Initial;
  factory SignInState.success() = _Success;
  factory SignInState.failure(SignInFailure failure) = _Failure;
}
