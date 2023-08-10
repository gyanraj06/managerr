import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:managerr/pages/dashboard.dart';
import 'package:managerr/pages/login_or_register.dart';
import 'package:managerr/pages/login_page.dart';

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
            print("HasData");
            return DashBoard();
          } else {
            //not logged in
            print("NoData");
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
