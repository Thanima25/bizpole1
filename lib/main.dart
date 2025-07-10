import 'package:bizpole_one_user/presentation/screens/login.dart';
import 'package:bizpole_one_user/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
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


// wrapping your app with Bloc


// void main() {
//   final authRepository = AuthRepositoryImpl(AuthRemoteDataSource(ApiClient()));
//
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => AuthBloc(
//             loginUser: LoginUser(authRepository),
//             signupUser: SignupUser(authRepository),
//           ),
//         ),
//       ],
//       child: const BizpoleApp(),
//     ),
//   );
// }


//bloc for login and signup
// BlocProvider(
// create: (_) => AuthBloc(
// loginUser: sl<LoginUser>(),
// signupUser: sl<SignupUser>(),
// ),
// child: const BizpoleSignupScreen(),
// ),
