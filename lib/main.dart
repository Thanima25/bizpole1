import 'package:bizpole_one_user/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'login.dart';
//
// void main() {
//   runApp( LoginPage());
// }
//
//
void main() {
  runApp(const BizpoleApp());
}

class BizpoleApp extends StatelessWidget {
  const BizpoleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bizpole',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
