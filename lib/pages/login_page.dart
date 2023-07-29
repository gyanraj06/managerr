import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerr/widgets/login_page_button.dart';
import 'package:managerr/widgets/square_tile.dart';
import 'package:managerr/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  // sign user in method
  void signUserIn() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060404),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  "assets/images/logo.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  'MANAGERR',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFFFC542F),
                    ),
                  ),
                ),
                Text(
                  'YOU\'RE BATTLE MADE EASY',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFDBEDED),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color(0xFFDBEDED),
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFDBEDED),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Color(0xFFDBEDED),
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFDBEDED),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTile(), //google button
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Color(0xFFDBEDED),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Register now',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Color(0xFFFC542F),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
