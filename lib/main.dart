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
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              // Logo
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

              // Heading
              const Text(
                "Let’s Build Together!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),

              // Username Field
              TextField(
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

              // Password Field
              TextField(
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

              // Remember Me and Forgot Password
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

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
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

              // Google Login
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
