import 'package:flutter/material.dart';

import '../../state/app_session.dart';
import '../survey/survey_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController directoryController = TextEditingController();
  final TextEditingController sportController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    directoryController.dispose();
    sportController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _createProfile() {
    AppSession.updateUser(
      name: nameController.text,
      directory: directoryController.text,
      sportName: sportController.text,
    );
    Navigator.pushReplacementNamed(context, SurveyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _SignupHero(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 34, 32, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'CREATE ATHLETE PROFILE',
                    style: GoogleFonts.spaceGrotesk(
                      color: Color(0xFF1B1B1F),
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Set up your pathway profile so recommendations can follow you through the app.',
                    style: TextStyle(
                      color: Color(0xFF6B6B73),
                      fontSize: 17,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _ProfileField(
                    controller: nameController,
                    label: 'FULL NAME',
                    hint: 'e.g. Michael Jordan',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 22),
                  _ProfileField(
                    controller: directoryController,
                    label: 'DIRECTORY ID',
                    hint: 'e.g. mjordan',
                    icon: Icons.badge_outlined,
                  ),
                  const SizedBox(height: 22),
                  _ProfileField(
                    controller: sportController,
                    label: 'SPORT',
                    hint: 'e.g. Basketball',
                    icon: Icons.sports_soccer,
                  ),
                  const SizedBox(height: 22),
                  _ProfileField(
                    controller: passwordController,
                    label: 'PASSWORD',
                    hint: '••••••••',
                    icon: Icons.lock_outline,
                    obscure: true,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 58,
                    child: ElevatedButton(
                      onPressed: _createProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC7002B),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        'START SURVEY  →',
                        style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 54,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1B1B1F),
                        side: const BorderSide(
                          color: Color(0xFFC9C9C9),
                          width: 2,
                        ),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        'BACK TO LOGIN',
                        style: TextStyle(
                          letterSpacing: 3,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignupHero extends StatelessWidget {
  const _SignupHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.fromLTRB(32, 30, 28, 26),
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 64,
            height: 64,
            color: const Color(0xFFC7002B),
            child: const Icon(
              Icons.shield_outlined,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(width: 18),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TERP PATHWAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'BUILD YOUR ATHLETE CAREER PATHWAY.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    height: 1.05,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;

  const _ProfileField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF666666),
            letterSpacing: 3,
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscure,
          
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.only(top: 18, bottom: 10),
            hintStyle: const TextStyle(
              color: Color(0xFFD9D9DE),
              fontWeight: FontWeight.w800,
            ),
            suffixIcon: Icon(icon, color: const Color(0xFFD0D0D5)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC9C9C9), width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC7002B), width: 2),
            ),
          ),

        ),
      ],
    );
  }
}
