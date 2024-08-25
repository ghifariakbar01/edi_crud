// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../style/style.dart';

class VAlertDialog extends ConsumerWidget {
  const VAlertDialog({
    Key? key,
    this.isLoading = false,
    required this.label,
    required this.labelDescription,
    required this.onPressed,
    this.onBackPressed,
    this.backPressedLabel,
    this.pressedLabel,
  }) : super(key: key);

  final bool isLoading;

  final String label;
  final String labelDescription;
  final String? backPressedLabel;
  final String? pressedLabel;

  final Function() onPressed;
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.spaceAround,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          label,
          style: Themes.customColor(
            20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          labelDescription,
          style: Themes.customColor(
            15,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (isLoading) ...[
            Center(
              child: SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(),
              ),
            )
          ],
          if (!isLoading) ...[
            InkWell(
              onTap: onBackPressed ?? () => context.pop(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  backPressedLabel ?? 'TIDAK',
                  style: Themes.customColor(
                    15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  pressedLabel ?? 'YA',
                  style: Themes.customColor(
                    15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class VSimpleDialog extends StatelessWidget {
  const VSimpleDialog({
    Key? key,
    required this.label,
    required this.labelDescription,
    required this.asset,
    this.color,
    this.textColor,
    this.fontSize,
  }) : super(key: key);

  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final String asset;
  final String label;
  final String labelDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleDialog(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        title: SizedBox(
          height: 28,
          child: Container(),
        ),
        children: [
          SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Themes.customColor(
                15,
                color: textColor ?? Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                labelDescription,
                textAlign: TextAlign.center,
                style: Themes.customColor(
                  11,
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VAlertDialog3 extends StatelessWidget {
  const VAlertDialog3({
    Key? key,
    required this.label,
    required this.labelDescription,
    required this.onPressed,
    required this.onBackPressed,
    this.pressedLabel,
    this.onBackPressedLabel,
    this.labelFont,
    this.height,
  }) : super(key: key);

  final String label;
  final String labelDescription;
  final String? pressedLabel;
  final String? onBackPressedLabel;
  final double? labelFont;
  final double? height;
  final Function() onPressed;
  final Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: height ?? 315,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style:
                          Themes.customColor(24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      labelDescription,
                      textAlign: TextAlign.center,
                      style: Themes.customColor(labelFont ?? 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Palette.red,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                )),
                            child: InkWell(
                              onTap: onBackPressed,
                              child: Center(
                                child: Text(
                                  onBackPressedLabel ?? 'Tidak',
                                  style: Themes.customColor(
                                    12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Palette.green,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                )),
                            child: InkWell(
                              onTap: onPressed,
                              child: Center(
                                child: Text(
                                  pressedLabel ?? 'Ok',
                                  style: Themes.customColor(
                                    12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VAlertDialog2 extends StatelessWidget {
  const VAlertDialog2({
    Key? key,
    required this.label,
    required this.onPressed,
    this.pressedLabel,
  }) : super(key: key);

  final String label;
  final String? pressedLabel;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 124,
        child: Stack(
          children: [
            Container(
              height: 124,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Themes.customColor(14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 25,
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: Ink(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Palette.red2,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10))),
                          child: InkWell(
                            onTap: context.pop,
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: Themes.customColor(
                                  12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: Ink(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Palette.green,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10))),
                          child: InkWell(
                            onTap: onPressed,
                            child: Center(
                              child: Text(
                                pressedLabel ?? 'Ok',
                                style: Themes.customColor(
                                  12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VBatalDialog extends StatelessWidget {
  const VBatalDialog({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          height: 150,
          child: Stack(
            children: [
              Container(
                height: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    'Apa anda ingin membatalkan Pengajuan ini?',
                    textAlign: TextAlign.center,
                    style: Themes.customColor(14),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Ink(
                  height: 31,
                  decoration: BoxDecoration(
                    color: Palette.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: InkWell(
                    onTap: onTap,
                    child: Center(
                      child: Text(
                        'Batalkan',
                        style: Themes.customColor(14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VFailedDialog extends StatelessWidget {
  const VFailedDialog({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Palette.red2,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                message ?? 'Anda tidak memiliki akses untuk Approval',
                textAlign: TextAlign.center,
                style: Themes.customColor(14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VFormDialog<T> extends ConsumerWidget {
  const VFormDialog({
    Key? key,
    this.isLoading = false,
    required this.label,
    required this.formController,
    this.onBackPressed,
    this.backPressedLabel,
    this.pressedLabel,
  }) : super(key: key);

  final bool isLoading;

  final String label;
  final String? backPressedLabel;
  final String? pressedLabel;

  final Function()? onBackPressed;
  final TextEditingController formController;
  //

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Dialog(
        // backgroundColor: Theme.of(context).primaryColor,
        // alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 124,
          child: Stack(
            children: [
              Container(
                height: 124,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  height: 71,
                  child: TextFormField(
                    maxLines: 2,
                    controller: formController,
                    decoration: Themes.formStyle(label),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Palette.red2,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10))),
                            child: InkWell(
                              onTap: onBackPressed ?? () => context.pop(),
                              child: Center(
                                child: Text(
                                  backPressedLabel ?? 'Cancel',
                                  style: Themes.customColor(
                                    12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Palette.green,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10))),
                            child: InkWell(
                              onTap: () => context.pop(
                                  formController.text.replaceAll("\n", " ")),
                              child: Center(
                                child: Text(
                                  pressedLabel ?? 'Ok',
                                  style: Themes.customColor(
                                    12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
