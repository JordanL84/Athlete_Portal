import 'package:flutter/material.dart';

import '../../state/app_session.dart';
import '../dashboard/dashboard_screen.dart';
import 'signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController directoryController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void dispose() {
    directoryController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _enterPortal() {
    AppSession.updateUser(directory: directoryController.text);
    Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _LoginHero(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 34, 32, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      _GoldSquare(),
                      SizedBox(width: 10),
                      Text(
                        'SECURE CAS PORTAL',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'MEMBER LOGIN',
                    style: GoogleFonts.spaceGrotesk(
                      color: Color(0xFF1B1B1F),
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Enter your University credentials to access your career pathway.',
                    style: TextStyle(
                      color: Color(0xFF6B6B73),
                      fontSize: 18,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 34),
                  _AuthField(
                    controller: directoryController,
                    label: 'DIRECTORY ID',
                    hint: 'e.g. mterrapin',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 26),
                  _AuthField(
                    controller: passwordController,
                    label: 'PASSWORD',
                    hint: '••••••••',
                    icon: Icons.lock_outline,
                    obscure: true,
                  ),
                  const SizedBox(height: 26),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() => rememberMe = value ?? false);
                        },
                      ),
                      const Text(
                        'REMEMBER ME',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'FORGOT?',
                          style: TextStyle(
                            color: Color(0xFFC7002B),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    height: 58,
                    child: ElevatedButton(
                      onPressed: _enterPortal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC7002B),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        'ENTER PORTAL  →',
                        style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: const [
                      Expanded(child: Divider(color: Color(0xFFE5E5E5))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          'NEW RECRUIT?',
                          style: TextStyle(
                            color: Color(0xFFB4B4BD),
                            letterSpacing: 4,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xFFE5E5E5))),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 58,
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, SignupScreen.routeName),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1B1B1F),
                        side: const BorderSide(
                          color: Color(0xFFC9C9C9),
                          width: 2,
                        ),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        'CREATE ATHLETE PROFILE',
                        style: TextStyle(
                          letterSpacing: 3,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 54),
                  const Text(
                    'This is a secure system authorized for University of Maryland student-athletes. By logging in, you agree to the terms of professional conduct and data privacy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB0B0BA),
                      height: 1.55,
                      fontWeight: FontWeight.w600,
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

class _LoginHero extends StatelessWidget {
  const _LoginHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.fromLTRB(32, 28, 28, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color(0xFF2A2A2A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                color: const Color(0xFFC7002B),
                child: const Icon(
                  Icons.shield_outlined,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 18),
              const Text(
                'TERP PATHWAY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'EQUIPPING',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const Text(
            'CHAMPIONS',
            style: TextStyle(
              color: Color(0xFFC7002B),
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          const Text(
            'FOR LIFE.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;

  const _AuthField({
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          
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

class _GoldSquare extends StatelessWidget {
  const _GoldSquare();

  @override
  Widget build(BuildContext context) {
    return Container(width: 10, height: 10, color: const Color(0xFF6E5A00));
  }
}
