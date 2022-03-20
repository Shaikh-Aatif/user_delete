import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final newemailcontroller = TextEditingController();
  final newpasswordcontroller = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim());
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: newemailcontroller.text.trim(),
          password: newpasswordcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.done,
            controller: newemailcontroller,
          ),
          TextField(
            textInputAction: TextInputAction.done,
            controller: newpasswordcontroller,
          ),
          ElevatedButton.icon(
              onPressed: signUp,
              icon: const Icon(Icons.lock),
              label: Text("Signup")),
          TextField(
            textInputAction: TextInputAction.done,
            controller: emailcontroller,
          ),
          TextField(
            textInputAction: TextInputAction.done,
            controller: passwordcontroller,
          ),
          ElevatedButton.icon(
              onPressed: signIn,
              icon: const Icon(Icons.lock),
              label: Text("Signin"))
        ],
      ),
    );
  }
}
