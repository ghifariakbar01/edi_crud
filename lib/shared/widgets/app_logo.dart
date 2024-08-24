import 'package:flutter/material.dart';

import '../../constants/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Image.asset(Assets.logo),
    );
  }
}
