import 'package:flutter/material.dart';

import '../../../app/assests_path.dart';

class userProfileAvatar extends StatelessWidget {
  final double  radius;
  const userProfileAvatar(
      this.radius,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(AssetsPath.userImageDemo),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
