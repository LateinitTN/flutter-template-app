import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

// ignore: must_be_immutable
class CirclePress extends StatelessWidget {
  double width;
  double height;
  Function onPress;
  Widget child;
  Color background;

  CirclePress({this.width, this.height, this.child, this.background, this.onPress});

  @override
  Widget build(BuildContext context) {
    background = background == null ? Colors.transparent : background;

    return Container(
      width: width,
      height: height,
      child: RawMaterialButton(
        onPressed: () {
          onPress();
        },
        fillColor: background,
        splashColor: colorText.withOpacity(0.3),
        elevation: 0.0,
        shape: CircleBorder(),
        child: child,
      ),
    );
  }
}
