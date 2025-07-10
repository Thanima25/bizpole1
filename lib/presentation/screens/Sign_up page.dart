import 'package:bizpole_one_user/presentation/screens/profile_page.dart';
import 'package:flutter/material.dart';

class BizpoleSignupScreen extends StatefulWidget {
  const BizpoleSignupScreen({Key? key}) : super(key: key);

  @override
  State<BizpoleSignupScreen> createState() => _BizpoleSignupScreenState();
}

class _BizpoleSignupScreenState extends State<BizpoleSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                // Logo and tagline
                Column(
                  children: [
                    Row(
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
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Text(
                          'e',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Start. Run. Grow.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                // Get Started title
                const Text(
                  'Get Started !',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 40),

                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email field
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5DC), // Beige color
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Password field
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5DC), // Beige color
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Create Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Confirm Password field
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5DC), // Beige color
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword = !_obscureConfirmPassword;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Remember me checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfileCompletionScreen()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // OR divider
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Google Sign In button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle Google sign in
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Google Sign In pressed')),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
                                height: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//sign up screen with bloc
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../bloc/auth_bloc.dart';
// import '../../screens/profile_page.dart';
//
// class BizpoleSignupScreen extends StatefulWidget {
//   const BizpoleSignupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<BizpoleSignupScreen> createState() => _BizpoleSignupScreenState();
// }
//
// class _BizpoleSignupScreenState extends State<BizpoleSignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _rememberMe = false;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   void _onSignupPressed() {
//     if (_formKey.currentState!.validate()) {
//       final email = _emailController.text.trim();
//       final password = _passwordController.text.trim();
//
//       context.read<AuthBloc>().add(SignupRequested(email, password));
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
//               SnackBar(content: Text("Signed up as ${state.user.username}")),
//             );
//
//             // ✅ Navigate to profile completion page
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (_) => const ProfileCompletionScreen()),
//             );
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         builder: (context, state) {
//           return SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 60),
//                     // Logo and tagline
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text('Bizpo', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//                         SizedBox(width: 4),
//                         CircleAvatar(backgroundColor: Colors.orange, radius: 6),
//                         Text('e', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     const Text('Start. Run. Grow.', style: TextStyle(color: Colors.grey)),
//                     const SizedBox(height: 60),
//                     const Text('Get Started !', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 40),
//
//                     // Email
//                     _buildField(
//                       controller: _emailController,
//                       hint: 'Email',
//                       icon: Icons.email_outlined,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Enter your email';
//                         if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                           return 'Enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     // Password
//                     _buildField(
//                       controller: _passwordController,
//                       hint: 'Create Password',
//                       icon: Icons.lock_outline,
//                       obscureText: _obscurePassword,
//                       suffix: IconButton(
//                         icon: Icon(
//                           _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                           color: Colors.grey,
//                         ),
//                         onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Enter a password';
//                         if (value.length < 6) return 'At least 6 characters';
//                         return null;
//                       },
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     // Confirm Password
//                     _buildField(
//                       controller: _confirmPasswordController,
//                       hint: 'Confirm Password',
//                       icon: Icons.lock_outline,
//                       obscureText: _obscureConfirmPassword,
//                       suffix: IconButton(
//                         icon: Icon(
//                           _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
//                           color: Colors.grey,
//                         ),
//                         onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Confirm your password';
//                         if (value != _passwordController.text) return 'Passwords do not match';
//                         return null;
//                       },
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     // Remember Me
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: _rememberMe,
//                           onChanged: (v) => setState(() => _rememberMe = v ?? false),
//                           activeColor: Colors.orange,
//                         ),
//                         const Text('Remember me', style: TextStyle(color: Colors.grey)),
//                       ],
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     // Signup Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: state is AuthLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : ElevatedButton(
//                         onPressed: _onSignupPressed,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         ),
//                         child: const Text('Signup', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                       ),
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     // Google button
//                     const Row(
//                       children: [
//                         Expanded(child: Divider(color: Colors.grey)),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           child: Text('OR', style: TextStyle(color: Colors.grey)),
//                         ),
//                         Expanded(child: Divider(color: Colors.grey)),
//                       ],
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     OutlinedButton(
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Google Sign In pressed')),
//                         );
//                       },
//                       style: OutlinedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                         side: const BorderSide(color: Colors.grey),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.network(
//                             'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
//                             height: 24,
//                           ),
//                           const SizedBox(width: 12),
//                           const Text('Login with Google', style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                     ),
//
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
//
//   Widget _buildField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     bool obscureText = false,
//     Widget? suffix,
//     String? Function(String?)? validator,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFF5F5DC),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         validator: validator,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.grey),
//           prefixIcon: Icon(icon, color: Colors.grey),
//           suffixIcon: suffix,
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         ),
//       ),
//     );
//   }
// }
