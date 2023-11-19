import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

void navigateTo({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

void showToast({
  required String message,
  required ToastState toastState,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: getState(toastState),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastState { error, success, warning }

Color getState(ToastState toastState) {
  switch (toastState) {
    case ToastState.error:
      return AppColors.red;
    case ToastState.success:
      return AppColors.primary;
    case ToastState.warning:
      return AppColors.orange;
  }
}
