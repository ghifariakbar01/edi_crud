// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      nama: json['nama'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      isActive: (json['is_active'] as num).toInt(),
      isAdmin: (json['is_admin'] as num).toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'password': instance.password,
      'email': instance.email,
      'is_active': instance.isActive,
      'is_admin': instance.isAdmin,
    };
