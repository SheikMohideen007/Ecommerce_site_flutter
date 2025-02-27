import 'package:ecommerce_site/screens/home.dart';
import 'package:ecommerce_site/screens/profile.dart';
import 'package:ecommerce_site/screens/sea_fish_details.dart';
import 'package:ecommerce_site/screens/seafish_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.mulishTextTheme()),
      debugShowCheckedModeBanner: false,
      home: SeaFishDetails(),
    );
  }
}
