import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arther_chat_app/services/auth/login_or_register.dart';

import '../../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return HomePage();
          }
          //user is NOT logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}