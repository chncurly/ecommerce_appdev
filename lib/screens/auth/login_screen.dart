import 'package:ecommerce/screens/auth/signup_screen.dart';
import 'package:ecommerce/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // Gawin nating dummy credentials para makapasok ka (pwedeng palitan)
  final String username = "";
  final String password = "";

  void login() async {
    setState(() {
      _isLoading = true;
    });

    if (username == _usernameController.text &&
        password == _passwordController.text) {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
      );
      setState(() {
        _isLoading = false;
      });
    } else {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _isLoading = false;

        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Wait!',
            message:
                'Something went wrong. Please check your email and password.',
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(color: Colors.black.withOpacity(0.8)),
          ),

          // 2. LOGIN FORM
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LOGO
                    Image.asset('ysl.png', width: 150),
                    const Text(
                      'Suit anything on you',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // EMAIL TEXTFIELD (Transparent/Glass style)
                    TextField(
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => login,
                      controller: _usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.white38),
                        fillColor: Colors.white.withOpacity(0.08),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white10),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 61, 59, 58),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // PASSWORD TEXTFIELD
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white38),
                        fillColor: Colors.white.withOpacity(0.08),
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white10),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 53, 49, 49),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // SIGN IN BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            39,
                            32,
                            32,
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // SIGN UP LINK
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.white54),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
