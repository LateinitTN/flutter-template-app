import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class SafeAreaWidget extends StatelessWidget {
  final Widget child;
  final Color color;

  const SafeAreaWidget({Key key, @required this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBackgroundPage,
      child: Stack(
        children: [
          //Status color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: kToolbarHeight,
              color: colorPrimary,
            ),
          ),

          SafeArea(
            child: child,
          )
        ],
      ),
    );
  }
}
