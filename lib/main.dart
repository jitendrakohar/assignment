import 'package:assignment1/model/HiveAdapter.dart';
import 'package:assignment1/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Initialize Hive with the Flutter-specific initialization
  await Hive.initFlutter();

  // Register the adapters
  Hive.registerAdapter(PostModelAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AppTesterHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),

      home: HomeScreen(),
    );
  }
}
