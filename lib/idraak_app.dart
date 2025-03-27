import 'package:flutter/material.dart';

class IdraakApp extends StatelessWidget {
  const IdraakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idraak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Kufam'),
    );
  }
}
