import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:managerr/pages/dashboard.dart';
import 'package:managerr/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth,
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return Dashboard();
          } 
          //not logged in
          
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
