import 'package:flutter/material.dart';
import 'package:modern_flutter/utils/ui_helper.dart';

class LinearGradientMask extends StatelessWidget {
  final Widget child;

  LinearGradientMask({this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            UIHelper.APPLE_GRADIENT_COLOR_ONE,
            UIHelper.APPLE_GRADIENT_COLOR_TWO,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
