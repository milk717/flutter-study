import 'package:flutter/material.dart';

ThemeData customStyle()=>ThemeData(
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
            size: 30,
          )
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      )
  );

