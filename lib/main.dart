import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_app/Screens/home_screen.dart';
import 'package:space_app/Screens/login_screen.dart';
import 'package:space_app/utilites/page_view.dart';

import 'Screens/planet_detailed_screen.dart';

void main() {
  return runApp(
    MaterialApp(
      initialRoute: "loginScreen",
      routes: {
        "loginScreen": (_) => loginScreen(),
        "homeScreen": (_) => homeScreen(),
        "planetDetailedScreen": (_) => planetDetailed(),
      },
    ),
  );
}
