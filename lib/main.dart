import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/pages/home.dart';
import 'package:flutter_world_time_app/pages/loading.dart';
import 'package:flutter_world_time_app/pages/location.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: false),
      initialRoute: '/', // اسم اول صفحة تفتح للمستخدم
      routes: {
        // تعريف الصفحات
        '/': (context) => const Loading(), // تعريف الصفحات
        "/home": (context) => const Home(),
        "/location": (context) => const Location(),
      },
    );
  }
}
