import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test191021/resources/app_color.dart';
import 'package:test191021/resources/app_text_theme.dart';
import 'package:test191021/resources/constants.dart';
import 'package:test191021/resources/icons.dart';
import 'package:test191021/screens/date_of_birth/screen.dart';
import 'package:test191021/screens/result_screen/screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(const CareApp());
}

class CareApp extends StatelessWidget {
  const CareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      // home: const DateOfBirthScreen(),
      home: const ResultScreen(),
    );
  }
}
