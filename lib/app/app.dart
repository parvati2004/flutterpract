import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // ✅ Add this line
import 'package:flutterpract/app/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Learn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      home: HomeView(),
    );
  }
}
