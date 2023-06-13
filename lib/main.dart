import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phasal/homepage.dart';
import 'package:phasal/utils/colors.dart';
import 'package:phasal/utils/extensions.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WomenApp());
}

class WomenApp extends StatelessWidget {
  const WomenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: backgroundColor.toColor())),
        home: HomePage());
  }
}
