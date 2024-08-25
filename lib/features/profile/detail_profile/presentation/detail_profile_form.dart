import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/user/application/user.dart';
import '../../../../shared/widgets/v_button.dart';
import '../../../../style/style.dart';
import '../application/detail_profile.dart';
import '../application/detail_profile_controller.dart';
import 'user_profile_detail_widget.dart';

class DetailProfileForm extends HookConsumerWidget {
  const DetailProfileForm({
    super.key,
    required this.det,
    required this.user,
  });

  final DetailProfile det;
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowError = useState(false);
    final _formKey = useMemoized(GlobalKey<FormState>.new, const []);

    final ktpController = useTextEditingController();
    final dobController = useTextEditingController();
    final posisiController = useTextEditingController();
    final jenisKelaminController = useTextEditingController();

    final dropdownList = [
      'Laki-laki',
      'Perempuan',
    ];

    final width = MediaQuery.of(context).size.width;

    useEffect(() {
      ktpController.text = det.noKtp;
      dobController.text = det.dob;
      posisiController.text = det.posisi;
      jenisKelaminController.text =
          det.jenisKelamin == 1 ? 'Laki-laki' : 'Perempuan';
      return () {
        ktpController.dispose();
        dobController.dispose();
        posisiController.dispose();
        jenisKelaminController.dispose();
      };
    }, []);

    return Form(
      key: _formKey,
      autovalidateMode: isShowError.value
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: ListView(
        children: [
          UserProfileDetailWidget(user: user),
          SizedBox(
            height: 24,
          ),
          Text(
            'Detail ID : ${det.id}',
            style: Themes.customColor(
              14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 50,
            width: width,
            child: TextFormField(
                controller: posisiController,
                decoration: Themes.formStyle('Masukkan Posisi yang Dilamar'),
                validator: (value) {
                  if (value == null) {
                    return 'Mohon Isi Posisi';
                  } else {
                    if (value.isEmpty) {
                      return 'Mohon Isi Posisi';
                    }
                    return null;
                  }
                }),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            width: width,
            child: TextFormField(
                controller: ktpController,
                keyboardType: TextInputType.number,
                decoration: Themes.formStyle('Masukkan No. KTP'),
                validator: (value) {
                  if (value == null) {
                    return 'Mohon Isi No. KTP';
                  } else {
                    if (value.isEmpty) {
                      return 'Mohon Isi No. KTP';
                    }
                    return null;
                  }
                }),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            width: width,
            child: DropdownButtonFormField<String>(
              elevation: 0,
              iconSize: 20,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.keyboard_arrow_down_rounded,
                  color: Palette.primaryColor),
              decoration: Themes.formStyleBordered(
                'Jenis Kelamin',
              ),
              validator: (value) {
                if (value == null) {
                  return 'Mohon Isi Jenis Kelamin';
                } else {
                  if (value.isEmpty) {
                    return 'Mohon Isi Jenis Kelamin';
                  }
                  return null;
                }
              },
              value: dropdownList.firstWhere(
                (element) => element == jenisKelaminController.text,
                orElse: () => dropdownList.first,
              ),
              onChanged: (String? value) {
                if (value != null) {
                  jenisKelaminController.text = value;
                }
              },
              isExpanded: true,
              items: dropdownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: Themes.customColor(
                      14,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            width: width,
            child: TextFormField(
                controller: dobController,
                decoration: Themes.formStyle('Masukkan Tempat, Tanggal Lahir'),
                validator: (value) {
                  if (value == null) {
                    return 'Mohon Isi Tempat, Tanggal Lahir';
                  } else {
                    if (value.isEmpty) {
                      return 'Mohon Isi Tempat, Tanggal Lahir';
                    }
                    return null;
                  }
                }),
          ),
          VButton(
              label: 'Submit Profile',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  return ref
                      .read(detailProfileControllerProvider.notifier)
                      .updateDetail(
                        id: user.id,
                        posisi: posisiController.text,
                        dob: dobController.text,
                        noKtp: ktpController.text,
                        jenisKelamin:
                            jenisKelaminController.text == 'Laki-laki' ? 1 : 0,
                      );
                } else {
                  isShowError.value = true;
                }
              }),
        ],
      ),
    );
  }
}
