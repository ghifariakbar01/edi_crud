import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_failure.freezed.dart';

@freezed
class SignInFailure with _$SignInFailure {
  factory SignInFailure.notFound() = _NotFound;
  factory SignInFailure.storage(String message) = _Storage;
}
