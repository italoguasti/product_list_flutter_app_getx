import 'package:flutter/material.dart';

import 'app_colors.dart';

gradientColorWidget() {
  return const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          AppColors.secondaryColor,
          AppColors.primaryColor,
          // Colors.black,
        ]),
  );
}
