// ignore_for_file: non_constant_identifier_names

import 'package:demo_firebase_auth/View/Screens/Home_Screen.dart';
import 'package:demo_firebase_auth/View/Screens/SignUp_Screen.dart';
import 'package:demo_firebase_auth/View/Widgets/Costume_Button.dart';
import 'package:demo_firebase_auth/View/Widgets/Costume_TextField.dart';
import 'package:demo_firebase_auth/View/Widgets/Costume_lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const mylotitie(
                lottieURl:
                    'https://assets3.lottiefiles.com/packages/lf20_q5pk6p1k.json'),
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MyTextField(
              hint: 'Entre your Email',
              isPassword: false,
              controller: _emailcontroller,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10.0,
            ),
            MyTextField(
              hint: 'Entre your password',
              isPassword: true,
              controller: _passwordcontroller,
            ),
            const SizedBox(
              height: 20.0,
            ),
            costumButton(
              bckClr: Colors.black,
              txtClr: Colors.white,
              btnTxt: 'Login',
              OnClick: () => loginNow(context),
            ),
            const SizedBox(
              height: 10.0,
            ),
            costumButton(
              bckClr: Colors.transparent,
              txtClr: Colors.black,
              btnTxt: 'SignUp',
              OnClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginNow(BuildContext context) async {
    if (_emailcontroller.text.isNotEmpty &&
        _passwordcontroller.text.isNotEmpty &&
        _passwordcontroller.text.length > 5) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailcontroller.text.trim(),
            password: _passwordcontroller.text.trim());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
