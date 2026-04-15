import 'package:flutter/material.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import 'signup_screen.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                const Text(
                  'Athlete Portal',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Sign in to continue',
                  style: TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 30),

                // Email
                const CustomTextField(
                  hintText: 'Email',
                ),

                const SizedBox(height: 16),

                // Password
                const CustomTextField(
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 24),

                // Sign In Button
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      DashboardScreen.routeName,
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Divider
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 20),

                // Sign Up Button
                CustomButton(
                  text: 'Create Account',
                  isOutlined: true,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SignupScreen.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}