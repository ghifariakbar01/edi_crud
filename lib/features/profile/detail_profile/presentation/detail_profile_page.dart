import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/user/application/user.dart';
import '../../../../shared/user/application/user_notifier.dart';
import '../../../../shared/utils/alert_helper.dart';
import '../../../../shared/utils/dialog_helper.dart';
import '../../../../shared/widgets/v_async_widget.dart';
import '../../../../shared/widgets/v_button.dart';
import '../../../../style/style.dart';

import '../application/detail_profile_controller.dart';
import '../application/detail_profile_notifier.dart';
import 'user_profile_detail_widget.dart';

class DetailProfilePage extends StatefulHookConsumerWidget {
  const DetailProfilePage(this.user, {super.key});

  final User user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailProfilePageState();
}

class _DetailProfilePageState extends ConsumerState<DetailProfilePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      return ref
          .read(detailProfileNotifierProvider.notifier)
          .getUserDetailBy(id: widget.user.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<int>>(detailProfileControllerProvider,
        (_, state) async {
      if (!state.isLoading &&
          state.hasValue &&
          state.value != null &&
          state.value != '' &&
          state.hasError == false) {
        final rows = state.requireValue;
        if (rows == 0) {
          return;
        }

        return AlertHelper.showSnackBar(
          context,
          message: '$rows rows affected',
          onDone: () async {
            context.pop();
            return ref.read(usersNotifierProvider.notifier).getAllUser();
          },
        );
      } else {
        if (state.hasError) {
          return DialogHelper.showCustomDialog(
            context,
            state.error.toString(),
          );
        }
      }
    });

    final isEditing = useState(false);

    final detail = ref.watch(detailProfileNotifierProvider);

    final ktpController = useTextEditingController();
    final dobController = useTextEditingController();
    final posisiController = useTextEditingController();
    final jenisKelaminController = useTextEditingController();

    final dropdownList = [
      'Laki-laki',
      'Perempuan',
    ];

    final width = MediaQuery.of(context).size.width;

    final isShowError = useState(false);
    final _formKey = useMemoized(GlobalKey<FormState>.new, const []);

    log('detail $detail');

    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(),
        body: VAsyncValueWidget(
          value: detail,
          data: (det) {
            ktpController.text = det.noKtp;
            dobController.text = det.dob;
            posisiController.text = det.posisi;
            jenisKelaminController.text =
                det.jenisKelamin == 1 ? 'Laki-laki' : 'Perempuan';

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Palette.greyDisabled.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: isShowError.value
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      UserProfileDetailWidget(user: widget.user),
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
                      isEditing.value
                          ? SizedBox(
                              height: 50,
                              width: width,
                              child: TextFormField(
                                  controller: posisiController,
                                  decoration: Themes.formStyle(
                                      'Masukkan Posisi yang Dilamar'),
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
                            )
                          : Text('Posisi yang Dilamar : ${det.posisi}',
                              style: Themes.customColor(
                                14,
                                fontWeight: FontWeight.w500,
                              )),
                      SizedBox(
                        height: 8,
                      ),
                      isEditing.value
                          ? SizedBox(
                              height: 50,
                              width: width,
                              child: TextFormField(
                                  controller: ktpController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      Themes.formStyle('Masukkan No. KTP'),
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
                            )
                          : Text(
                              'No Ktp : ${det.noKtp}',
                              style: Themes.customColor(
                                14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      SizedBox(
                        height: 8,
                      ),
                      isEditing.value
                          ? SizedBox(
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
                                  (element) =>
                                      element == jenisKelaminController.text,
                                  orElse: () => dropdownList.first,
                                ),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    jenisKelaminController.text = value;
                                  }
                                },
                                isExpanded: true,
                                items: dropdownList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
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
                            )
                          : Text(
                              'Jenis kelamin : ${det.jenisKelamin == 1 ? 'Laki-laki' : 'Perempuan'}',
                              style: Themes.customColor(
                                14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      SizedBox(
                        height: 8,
                      ),
                      isEditing.value
                          ? SizedBox(
                              height: 50,
                              width: width,
                              child: TextFormField(
                                  controller: dobController,
                                  decoration: Themes.formStyle(
                                      'Masukkan Tempat, Tanggal Lahir'),
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
                            )
                          : Text(
                              'Tempat, Tanggal Lahir : ${det.dob}',
                              style: Themes.customColor(
                                14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      Expanded(child: SizedBox()),
                      if (isEditing.value == false) ...[
                        VButton(
                            label: 'Edit Profile',
                            onPressed: () {
                              isEditing.value == true
                                  ? isEditing.value = false
                                  : isEditing.value = true;
                            })
                      ] else ...[
                        VButton(
                            label: 'Submit Profile',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                return ref
                                    .read(detailProfileControllerProvider
                                        .notifier)
                                    .updateDetail(
                                      id: widget.user.id,
                                      posisi: posisiController.text,
                                      dob: dobController.text,
                                      noKtp: ktpController.text,
                                      jenisKelamin:
                                          jenisKelaminController.text ==
                                                  'Laki-laki'
                                              ? 1
                                              : 0,
                                    );
                              } else {
                                isShowError.value = true;
                              }
                            }),
                        VButton(
                            label: 'Cancel Edit',
                            onPressed: () {
                              isEditing.value = false;
                            }),
                      ]
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
