import 'package:climate/app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastManager {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: Color(0xFFFF00b09b),
      webBgColor: "linear-gradient(to right, #00b09b, #00b09b)",
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showWarning(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: Color(0xFFFFffcc00),
      webBgColor: "linear-gradient(to right, #ffcc00, #ffcc00)",
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      webBgColor: "linear-gradient(to right, #FC466B, #FC466B)",
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
