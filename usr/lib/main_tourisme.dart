import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/admin/admin_tourisme_dashboard.dart';
import '../screens/tourisme/tourisme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourisme Maroc - Administration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/admin': (context) => const AdminDashboard(),
        '/site-touristique': (context) => const TourismeApp(),
      },
    );
  }
}