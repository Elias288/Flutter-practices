import 'package:flutter/material.dart';
import 'package:flutter_crud/utils/contact.dart';
import 'package:flutter_crud/pages/my_home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox('contactsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage('Flutter Contact App'),
      debugShowCheckedModeBanner: false,
    );
  }
}
