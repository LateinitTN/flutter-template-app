import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class AppLogoWidget extends StatelessWidget {
  final double width;
  final double height;
  AppLogoWidget({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      elevation: 0.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusCustom.normal),
      ),
      child: Image(
        // image: AssetImage(F.appLogo),
        image: AssetImage(""),
        width: width,
        height: height,
      ),
    );
  }
}
