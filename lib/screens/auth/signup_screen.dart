import 'package:flutter/material.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../survey/survey_screen.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  const SignupScreen({super.key});

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
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Start your athlete career journey',
                  style: TextStyle(color: Colors.black54),
                ),

                const SizedBox(height: 30),

                const CustomTextField(
                  hintText: 'Full Name',
                ),

                const SizedBox(height: 16),

                const CustomTextField(
                  hintText: 'Email',
                ),

                const SizedBox(height: 16),

                const CustomTextField(
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 16),

                const CustomTextField(
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 24),

                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SurveyScreen.routeName,
                    );
                  },
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Already have an account? Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}