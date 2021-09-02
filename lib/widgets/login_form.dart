import 'package:diary/screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'input_decorator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    GlobalKey<FormState>? fromKey,
  })  : _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _globalKey = fromKey,
        super(key: key);

  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final GlobalKey<FormState>? _globalKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              validator: (value) {
                return value!.isEmpty ? 'Please enter an email' : null;
              },
              controller: _emailTextController,
              decoration: buildInputDecoration('Email address', 'john@me.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              validator: (value) {
                return value!.isEmpty ? 'Please enter a password' : null;
              },
              obscureText: true,
              controller: _passwordTextController,
              decoration: buildInputDecoration('password', ''),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.green,
                textStyle: TextStyle(
                  fontSize: 20,
                )),
            onPressed: () {
              if (_globalKey!.currentState!.validate()) {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then(
                  (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainPage();
                        },
                      ),
                    );
                  },
                );
              }
              ;
            },
            child: Text('Sing In'),
          ),
        ],
      ),
    );
  }
}
