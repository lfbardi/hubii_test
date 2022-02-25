import 'package:flutter/material.dart';
import 'package:hubii_test/features/suppliers_on_map/presentation/pages/home_page.dart';
import 'injection_container.dart' as dependency_injection;

void main() {
  dependency_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hubii test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
