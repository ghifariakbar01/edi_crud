import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_failure.freezed.dart';

@freezed
class SignUpFailure with _$SignUpFailure {
  factory SignUpFailure.storage() = _Storage;
  factory SignUpFailure.alreadyExist() = _AlreadyExist;
}
