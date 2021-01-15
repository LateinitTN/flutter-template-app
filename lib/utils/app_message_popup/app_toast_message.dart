import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/app_constants.dart';

// ignore: non_constant_identifier_names
void ToastMessageError(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: FontSize.normal);
}

// ignore: non_constant_identifier_names
void ToastMessage(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorPrimary,
      textColor: Colors.white,
      fontSize: FontSize.normal);
}
