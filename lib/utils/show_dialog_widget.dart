import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Future showDialogCustomize(
    BuildContext context, DialogType dialogType, String title, String desc) {
  return AwesomeDialog(
          context: context,
          dialogType: dialogType,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: title,
          desc: desc,
          btnCancelOnPress: () {})
      .show();
}

Future quickAlert(BuildContext context, String infor, QuickAlertType type) {
  return QuickAlert.show(
    context: context,
    type: type,
    text: infor,
  );
}

Future showToast(String infor) {
  return Fluttertoast.showToast(
      msg: infor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
