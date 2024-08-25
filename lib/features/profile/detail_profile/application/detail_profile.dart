import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_profile.freezed.dart';
part 'detail_profile.g.dart';

@freezed
class DetailProfile with _$DetailProfile {
  factory DetailProfile({
    required int id,
    required String posisi,
    required String dob,
    @JsonKey(name: 'no_ktp') required String noKtp,
    @JsonKey(name: 'jenis_kelamin') required int jenisKelamin,
  }) = _DetailProfile;

  factory DetailProfile.initial() => DetailProfile(
        id: 0,
        posisi: '',
        dob: '',
        noKtp: '',
        jenisKelamin: 0,
      );

  factory DetailProfile.fromJson(Map<String, dynamic> json) =>
      _$DetailProfileFromJson(json);
}
