// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateUserFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() alreadyExist,
    required TResult Function(String message) storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? alreadyExist,
    TResult? Function(String message)? storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? alreadyExist,
    TResult Function(String message)? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlreadyExist value) alreadyExist,
    required TResult Function(_Storage value) storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlreadyExist value)? alreadyExist,
    TResult? Function(_Storage value)? storage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlreadyExist value)? alreadyExist,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserFailureCopyWith<$Res> {
  factory $CreateUserFailureCopyWith(
          CreateUserFailure value, $Res Function(CreateUserFailure) then) =
      _$CreateUserFailureCopyWithImpl<$Res, CreateUserFailure>;
}

/// @nodoc
class _$CreateUserFailureCopyWithImpl<$Res, $Val extends CreateUserFailure>
    implements $CreateUserFailureCopyWith<$Res> {
  _$CreateUserFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AlreadyExistImplCopyWith<$Res> {
  factory _$$AlreadyExistImplCopyWith(
          _$AlreadyExistImpl value, $Res Function(_$AlreadyExistImpl) then) =
      __$$AlreadyExistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlreadyExistImplCopyWithImpl<$Res>
    extends _$CreateUserFailureCopyWithImpl<$Res, _$AlreadyExistImpl>
    implements _$$AlreadyExistImplCopyWith<$Res> {
  __$$AlreadyExistImplCopyWithImpl(
      _$AlreadyExistImpl _value, $Res Function(_$AlreadyExistImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AlreadyExistImpl implements _AlreadyExist {
  _$AlreadyExistImpl();

  @override
  String toString() {
    return 'CreateUserFailure.alreadyExist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlreadyExistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() alreadyExist,
    required TResult Function(String message) storage,
  }) {
    return alreadyExist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? alreadyExist,
    TResult? Function(String message)? storage,
  }) {
    return alreadyExist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? alreadyExist,
    TResult Function(String message)? storage,
    required TResult orElse(),
  }) {
    if (alreadyExist != null) {
      return alreadyExist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlreadyExist value) alreadyExist,
    required TResult Function(_Storage value) storage,
  }) {
    return alreadyExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlreadyExist value)? alreadyExist,
    TResult? Function(_Storage value)? storage,
  }) {
    return alreadyExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlreadyExist value)? alreadyExist,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (alreadyExist != null) {
      return alreadyExist(this);
    }
    return orElse();
  }
}

abstract class _AlreadyExist implements CreateUserFailure {
  factory _AlreadyExist() = _$AlreadyExistImpl;
}

/// @nodoc
abstract class _$$StorageImplCopyWith<$Res> {
  factory _$$StorageImplCopyWith(
          _$StorageImpl value, $Res Function(_$StorageImpl) then) =
      __$$StorageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StorageImplCopyWithImpl<$Res>
    extends _$CreateUserFailureCopyWithImpl<$Res, _$StorageImpl>
    implements _$$StorageImplCopyWith<$Res> {
  __$$StorageImplCopyWithImpl(
      _$StorageImpl _value, $Res Function(_$StorageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StorageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StorageImpl implements _Storage {
  _$StorageImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CreateUserFailure.storage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageImplCopyWith<_$StorageImpl> get copyWith =>
      __$$StorageImplCopyWithImpl<_$StorageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() alreadyExist,
    required TResult Function(String message) storage,
  }) {
    return storage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? alreadyExist,
    TResult? Function(String message)? storage,
  }) {
    return storage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? alreadyExist,
    TResult Function(String message)? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AlreadyExist value) alreadyExist,
    required TResult Function(_Storage value) storage,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AlreadyExist value)? alreadyExist,
    TResult? Function(_Storage value)? storage,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AlreadyExist value)? alreadyExist,
    TResult Function(_Storage value)? storage,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class _Storage implements CreateUserFailure {
  factory _Storage(final String message) = _$StorageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$StorageImplCopyWith<_$StorageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
