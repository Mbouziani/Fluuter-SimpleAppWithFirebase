import 'package:demo_firebase_auth/View/Screens/Login_Screen.dart';
import 'package:demo_firebase_auth/View/Widgets/Costume_Button.dart';
import 'package:demo_firebase_auth/View/Widgets/Costume_TextField.dart';
import 'package:demo_firebase_auth/View/Widgets/Costume_lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();

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
                  'https://assets9.lottiefiles.com/packages/lf20_mjlh3hcy.json',
            ),
            const Text(
              'Username',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hint: 'Entre your Username',
              isPassword: false,
              controller: _usernamecontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hint: 'Entre your Email',
              isPassword: false,
              controller: _emailcontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hint: 'Entre your Password',
              isPassword: true,
              controller: _passwordcontroller,
            ),
            const SizedBox(
              height: 20.0,
            ),
            costumButton(
              bckClr: Colors.black,
              txtClr: Colors.white,
              btnTxt: 'Sign Up',
              OnClick: () => SingupNow(context),
            ),
            const SizedBox(
              height: 10.0,
            ),
            costumButton(
              bckClr: Colors.transparent,
              txtClr: Colors.black,
              btnTxt: 'Login',
              OnClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
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

  Future<void> SingupNow(BuildContext context) async {
    if (_emailcontroller.text.isNotEmpty &&
        _passwordcontroller.text.isNotEmpty &&
        _passwordcontroller.text.length > 5) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailcontroller.text.trim(),
            password: _passwordcontroller.text.trim());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
