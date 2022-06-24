import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/homepage.dart';

class CodeMagicDemo extends StatelessWidget {
  const CodeMagicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Codemagic Demo",
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFFFFE589),
        backgroundColor: const Color(0xFFF8F8F8),
        scaffoldBackgroundColor: Colors.white,
        primaryIconTheme: const IconThemeData(
          color: Color(0xFF444444),
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.normal,
            color: Color(0xFF444444),
            fontSize: 18,
          ),
          iconTheme: const IconThemeData().copyWith(
            color: const Color(0xFF444444),
          ),
        ),
        primaryTextTheme: const TextTheme(
          displayMedium: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF444444),
          ),
          titleMedium: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF444444),
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF999999),
          ),
          bodyMedium: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFF444444),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              const Color(0xFF1E78FF),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
