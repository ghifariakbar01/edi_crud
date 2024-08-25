// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailProfile _$DetailProfileFromJson(Map<String, dynamic> json) {
  return _DetailProfile.fromJson(json);
}

/// @nodoc
mixin _$DetailProfile {
  int get id => throw _privateConstructorUsedError;
  String get posisi => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_ktp')
  String get noKtp => throw _privateConstructorUsedError;
  @JsonKey(name: 'jenis_kelamin')
  int get jenisKelamin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailProfileCopyWith<DetailProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailProfileCopyWith<$Res> {
  factory $DetailProfileCopyWith(
          DetailProfile value, $Res Function(DetailProfile) then) =
      _$DetailProfileCopyWithImpl<$Res, DetailProfile>;
  @useResult
  $Res call(
      {int id,
      String posisi,
      String dob,
      @JsonKey(name: 'no_ktp') String noKtp,
      @JsonKey(name: 'jenis_kelamin') int jenisKelamin});
}

/// @nodoc
class _$DetailProfileCopyWithImpl<$Res, $Val extends DetailProfile>
    implements $DetailProfileCopyWith<$Res> {
  _$DetailProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? posisi = null,
    Object? dob = null,
    Object? noKtp = null,
    Object? jenisKelamin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posisi: null == posisi
          ? _value.posisi
          : posisi // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      noKtp: null == noKtp
          ? _value.noKtp
          : noKtp // ignore: cast_nullable_to_non_nullable
              as String,
      jenisKelamin: null == jenisKelamin
          ? _value.jenisKelamin
          : jenisKelamin // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailProfileImplCopyWith<$Res>
    implements $DetailProfileCopyWith<$Res> {
  factory _$$DetailProfileImplCopyWith(
          _$DetailProfileImpl value, $Res Function(_$DetailProfileImpl) then) =
      __$$DetailProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String posisi,
      String dob,
      @JsonKey(name: 'no_ktp') String noKtp,
      @JsonKey(name: 'jenis_kelamin') int jenisKelamin});
}

/// @nodoc
class __$$DetailProfileImplCopyWithImpl<$Res>
    extends _$DetailProfileCopyWithImpl<$Res, _$DetailProfileImpl>
    implements _$$DetailProfileImplCopyWith<$Res> {
  __$$DetailProfileImplCopyWithImpl(
      _$DetailProfileImpl _value, $Res Function(_$DetailProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? posisi = null,
    Object? dob = null,
    Object? noKtp = null,
    Object? jenisKelamin = null,
  }) {
    return _then(_$DetailProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posisi: null == posisi
          ? _value.posisi
          : posisi // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      noKtp: null == noKtp
          ? _value.noKtp
          : noKtp // ignore: cast_nullable_to_non_nullable
              as String,
      jenisKelamin: null == jenisKelamin
          ? _value.jenisKelamin
          : jenisKelamin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailProfileImpl implements _DetailProfile {
  _$DetailProfileImpl(
      {required this.id,
      required this.posisi,
      required this.dob,
      @JsonKey(name: 'no_ktp') required this.noKtp,
      @JsonKey(name: 'jenis_kelamin') required this.jenisKelamin});

  factory _$DetailProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailProfileImplFromJson(json);

  @override
  final int id;
  @override
  final String posisi;
  @override
  final String dob;
  @override
  @JsonKey(name: 'no_ktp')
  final String noKtp;
  @override
  @JsonKey(name: 'jenis_kelamin')
  final int jenisKelamin;

  @override
  String toString() {
    return 'DetailProfile(id: $id, posisi: $posisi, dob: $dob, noKtp: $noKtp, jenisKelamin: $jenisKelamin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posisi, posisi) || other.posisi == posisi) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.noKtp, noKtp) || other.noKtp == noKtp) &&
            (identical(other.jenisKelamin, jenisKelamin) ||
                other.jenisKelamin == jenisKelamin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, posisi, dob, noKtp, jenisKelamin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailProfileImplCopyWith<_$DetailProfileImpl> get copyWith =>
      __$$DetailProfileImplCopyWithImpl<_$DetailProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailProfileImplToJson(
      this,
    );
  }
}

abstract class _DetailProfile implements DetailProfile {
  factory _DetailProfile(
          {required final int id,
          required final String posisi,
          required final String dob,
          @JsonKey(name: 'no_ktp') required final String noKtp,
          @JsonKey(name: 'jenis_kelamin') required final int jenisKelamin}) =
      _$DetailProfileImpl;

  factory _DetailProfile.fromJson(Map<String, dynamic> json) =
      _$DetailProfileImpl.fromJson;

  @override
  int get id;
  @override
  String get posisi;
  @override
  String get dob;
  @override
  @JsonKey(name: 'no_ktp')
  String get noKtp;
  @override
  @JsonKey(name: 'jenis_kelamin')
  int get jenisKelamin;
  @override
  @JsonKey(ignore: true)
  _$$DetailProfileImplCopyWith<_$DetailProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
