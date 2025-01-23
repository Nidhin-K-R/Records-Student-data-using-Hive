import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive_practice_1/splashscreen.dart';
import 'package:hive_practice_1/student.dart';

late Box<Student> boxPersons;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  boxPersons = await Hive.openBox<Student>('student');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
