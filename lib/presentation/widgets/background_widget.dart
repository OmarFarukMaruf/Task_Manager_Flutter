import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_path.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        SvgPicture.asset(AssetPath.backgroundSVG,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover),

          SafeArea(child: child)
    ]
    );
  }
}
