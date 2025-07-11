import 'package:bizpole_one_user/presentation/screens/Sign_up page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BizpoleApp());
}

class BizpoleApp extends StatelessWidget {
  const BizpoleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bizpole Login',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins',
      ),
      home: const BizpoleSignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _errorMessage;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username == 'bizpole' && password == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const BizpoleApp()),
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bizpole',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Start. Run. Grow.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Let’s Build Together!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 16),
              const Text("OR"),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
                    height: 24,
                  ),
                  label: const Text("Login with Google"),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

//login page with bloc integrated
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../bloc/auth_bloc.dart';
// import '../../../core/utils/validators.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   void _onLoginPressed() {
//     if (_formKey.currentState!.validate()) {
//       final username = _usernameController.text.trim();
//       final password = _passwordController.text;
//
//       context.read<AuthBloc>().add(LoginRequested(username, password));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Welcome ${state.user.username}!")),
//             );
//             // TODO: Navigate to home or dashboard screen
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Bizpole',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     const Text(
//                       "Let’s Build Together!",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(height: 24),
//                     TextFormField(
//                       controller: _usernameController,
//                       decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.person),
//                         hintText: 'Username',
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       validator: Validators.validateUsername,
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.lock),
//                         hintText: 'Password',
//                         filled: true,
//                         fillColor: Colors.grey.shade100,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       validator: Validators.validatePassword,
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Checkbox(value: false, onChanged: (_) {}),
//                             const Text("Remember me"),
//                           ],
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text("Forgot password?", style: TextStyle(color: Colors.orange)),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: state is AuthLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : ElevatedButton(
//                         onPressed: _onLoginPressed,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text("Login"),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Text("OR"),
//                     const SizedBox(height: 16),
//                     OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Image.network(
//                         'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
//                         height: 24,
//                       ),
//                       label: const Text("Login with Google"),
//                       style: OutlinedButton.styleFrom(
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         side: const BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//

