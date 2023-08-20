import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:managerr/pages/notes/dashboard.dart';
import 'package:managerr/pages/registration/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //logged in
          if (snapshot.hasData) {
            return DashBoard();
          } else {
            //not logged in
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
