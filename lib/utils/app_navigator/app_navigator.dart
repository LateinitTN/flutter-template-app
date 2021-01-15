import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

Future open(page, context) async {
  var route = CupertinoPageRoute(builder: (BuildContext context) => page);
  await Navigator.of(context).push(route);
}

Future openDelay(page, context) async {
  Future.delayed(const Duration(milliseconds: openPageDuration), () async {
    var route = CupertinoPageRoute(builder: (BuildContext context) => page);
    await Navigator.of(context).push(route);
  });
}

Future openMaterial(page, context) async {
  var route = MaterialPageRoute(builder: (BuildContext context) => page);
  await Navigator.push(context, route);
}

void closeDelay(context, request) {
  Future.delayed(const Duration(milliseconds: openPageDuration), () async {
    if (request != "")
      Navigator.of(context).pop(request);
    else
      Navigator.of(context).pop();
  });
}

void close(context) {
  Navigator.of(context).pop();
}

// void logOut(context) {
//   var route = CupertinoPageRoute(builder: (BuildContext context) => SplashPage());
//   Navigator.of(context).push(route);
// }
