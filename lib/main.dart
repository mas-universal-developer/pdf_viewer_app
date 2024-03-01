import 'package:flutter/material.dart';
import 'package:myapp/providers/pdf_provider.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PdfProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PDF Viewer App',
        home: HomeScreen(),
      ),
    );
  }
}