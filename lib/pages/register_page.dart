import 'package:flutter/material.dart';
import 'package:arther_chat_app/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

// ignore: must_be_immutable
class Register_page extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _ConfirmPWController = TextEditingController();
  // tap to go to login page
  void Function()? onTap;

  Register_page({super.key, required this.onTap});

  //register
  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();
    // passwords match -> create user
    if (_pwController.text == _ConfirmPWController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ));
      }
    }
    // passwords dont match -> tell user to fix
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Passwords don't match!"),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            //welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            const SizedBox(
              height: 25,
            ),
            // email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            //pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),
            const SizedBox(
              height: 16,
            ),
            //pw textfield
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _ConfirmPWController,
            ),
            const SizedBox(
              height: 25,
            ),
            //login button
            MyButton(
              buttonText: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            //register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}