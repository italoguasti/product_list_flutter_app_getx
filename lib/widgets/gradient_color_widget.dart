import 'package:flutter/material.dart';

gradientColorWidget() {
  return const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Color(0xff4158bbf),
          Color(0xFF4a00e0),
          // Colors.black,
        ]),
  );
}
