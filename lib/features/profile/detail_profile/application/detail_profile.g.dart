// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailProfileImpl _$$DetailProfileImplFromJson(Map<String, dynamic> json) =>
    _$DetailProfileImpl(
      id: (json['id'] as num).toInt(),
      posisi: json['posisi'] as String,
      dob: json['dob'] as String,
      noKtp: json['no_ktp'] as String,
      jenisKelamin: (json['jenis_kelamin'] as num).toInt(),
    );

Map<String, dynamic> _$$DetailProfileImplToJson(_$DetailProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'posisi': instance.posisi,
      'dob': instance.dob,
      'no_ktp': instance.noKtp,
      'jenis_kelamin': instance.jenisKelamin,
    };
