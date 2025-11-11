import 'package:flutter/material.dart';
import 'package:foxcare_mining/screens/mining_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boost Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false, 
      home: const HomeScreen(),
    );
  }
}
