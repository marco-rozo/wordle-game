import 'package:flutter/material.dart';
import 'package:wordle_app/app/core/consts/colors.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String description,
    required VoidCallback action,
    Duration duration = const Duration(days: 1),
    SnackBarType snackType = SnackBarType.error,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.none,
        duration: duration,
        content: Text(
          description,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: _getSnackbarTextColor(snackType),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        // showCloseIcon: true,
        // closeIconColor: _getSnackbarTextColor(snackType),
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        backgroundColor: _getSnackbarColor(snackType),
        padding: const EdgeInsets.only(
          left: 16,
          right: 8,
          top: 14,
          bottom: 14,
        ),
        margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        action: SnackBarAction(
            onPressed: action,
            textColor: Colors.white,
            label: 'Play again',
          ),
      ),
    );
  }

  static Color _getSnackbarColor(SnackBarType type) {
    if (type == SnackBarType.error) return CustomColors.redE85F5F;
    if (type == SnackBarType.succes) return CustomColors.green538D4E;
    return Colors.white;
  }

  static Color _getSnackbarTextColor(SnackBarType type) {
    if (type == SnackBarType.error || type == SnackBarType.succes) {
      return Colors.white;
    }

    return CustomColors.black1C1C1C;
  }
}

enum SnackBarType { succes, error, info }
