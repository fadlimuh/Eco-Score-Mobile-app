import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecoscore/diet1.dart';
import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/sign_up.dart';
import 'package:flutter_ecoscore/widget/button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 60.0),
              Text('Sign In to your account',
                  style: regularTextStyle.copyWith(
                      fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.0),
              TextFormField(
                key: ValueKey('emailField'), // For easier testing
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle: regularTextStyle,
                  hintStyle: regularTextStyle,
                  labelText: 'Your email',
                  hintText: 'Enter your email address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-z_+%=-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (newValue) => _email = newValue!,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                key: ValueKey('passwordField'), // For easier testing
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: regularTextStyle,
                  hintStyle: regularTextStyle,
                  labelText: 'Your password',
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (newValue) => _password = newValue!,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextButton(
                    title: 'Forgot Passoword?',
                    onTap: () {},
                    buttonColor: blackColor),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DietPreferenceScreen()),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: regularTextStyle.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 60, 50.0),
                      maximumSize:
                          Size(MediaQuery.of(context).size.width - 60, 50.0),
                      backgroundColor: blackColor)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: blackTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      'Sign up here.',
                      style: regularTextStyle.copyWith(
                          fontWeight: FontWeight.bold, color: redColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
