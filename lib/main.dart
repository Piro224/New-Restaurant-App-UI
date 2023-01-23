import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_restaurant_app_ui/intro_page.dart';
import 'package:new_restaurant_app_ui/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant app',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        iconTheme: const IconThemeData(color: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home:    IntroPage(productModel: ProductModel(),),
    );
  }
}
