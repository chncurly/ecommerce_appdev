import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ysl',
      theme: ThemeData(
        useMaterial3: true,

        primaryColor: const Color.fromARGB(255, 35, 32, 32),
      ),
      home: LoginScreen(),
    );
  }
}
