import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/assets.dart';
import '../../style/style.dart';
import '../widgets/v_dialogs.dart';

class OSVibrate {
  static Future<void> vibrate() async => Platform.isIOS
      ? await HapticFeedback.lightImpact()
      : await HapticFeedback.vibrate();
}

class DialogHelper<T> {
  static Future<void> showCustomDialog(
    BuildContext context,
    String msg, {
    Color? color,
    String? label,
    String? assets,
    bool? isLarge,
  }) async {
    return OSVibrate.vibrate().then((_) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => VSimpleDialog(
              label: label ?? 'Oops',
              fontSize: isLarge == null ? 11 : 13,
              labelDescription: msg,
              color: color ?? Palette.red,
              asset: assets ?? Assets.logo,
            )));
  }

  Future<String?> showFormDialog({
    String? label,
    required BuildContext context,
  }) async {
    TextEditingController? formController;

    formController = TextEditingController();

    final String? result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => VFormDialog(
        label: label ?? 'Note HRD',
        formController: formController!,
      ),
    );

    formController = null;
    if (result != null) {
      return result;
    }

    return null;
  }

  static Future<void> showConfirmationDialog({
    String? label,
    required BuildContext context,
    required Function() onPressed,
  }) async {
    return OSVibrate.vibrate().then((value) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => VAlertDialog2(
              label: label ?? 'Oops',
              onPressed: onPressed,
            )));
  }
}
