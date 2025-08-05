import 'package:flutter/material.dart';
import '../../../app/assests_path.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;

  const AppLogo({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.appLogo,
      height: height,
      width: width,
    );
  }
}
