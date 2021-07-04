import 'package:flutter/material.dart';

final gradientBgBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
    colors: [
      Colors.deepPurple[300],
      Colors.deepPurple[400],
      Colors.deepPurple[500],
      Colors.deepPurple[600],
      Colors.deepPurple[700]
    ],
  ),
);
