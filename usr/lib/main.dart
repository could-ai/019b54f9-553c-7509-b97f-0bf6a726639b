import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_theme.dart';
import 'package:couldai_user_app/screens/auth/login_screen.dart';
import 'package:couldai_user_app/screens/admin/admin_dashboard.dart';
import 'package:couldai_user_app/screens/client/client_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CouldAI Project',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Configuration des routes pour la navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/admin': (context) => const AdminDashboard(),
        '/client': (context) => const ClientHome(),
      },
    );
  }
}
