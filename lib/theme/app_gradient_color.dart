import 'package:flutter/material.dart';

import 'app_colors.dart';

gradientColorWidget() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          AppColors.primary,
          AppColors.lightPurple,
          // Colors.black,
        ]),
  );
}
