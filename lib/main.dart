import 'package:flutter/material.dart';
import 'package:pet_ui/View/Dashboard.dart';
import 'package:pet_ui/View/services.dart';
import 'package:pet_ui/View/customers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pet Sitter App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Home screen
      initialRoute: '/',
      // Named routes for easy navigation
      routes: {
        '/': (context) => const PetSitterDashboard(),
        '/services': (context) => const SitterServices(),
        '/customers': (context) => const SitterCustomers(),
      },
    );
  }
}
