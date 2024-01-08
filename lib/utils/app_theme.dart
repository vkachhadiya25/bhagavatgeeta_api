import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black12,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  brightness: Brightness.dark,
);
