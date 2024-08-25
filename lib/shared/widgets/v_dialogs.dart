// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../style/style.dart';

class VAlertDialog extends ConsumerWidget {
  const VAlertDialog({
    Key? key,
    required this.label,
    required this.labelDescription,
    required this.onPressed,
    this.onBackPressed,
    this.backPressedLabel,
    this.pressedLabel,
  }) : super(key: key);

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
          Center(
            child: SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(),
            ),
          ),
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
        height: 174,
        child: Stack(
          children: [
            Container(
              height: 174,
              decoration: BoxDecoration(
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
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Ink(
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
                    Expanded(
                      child: Ink(
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
