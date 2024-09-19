import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecoscore/diet1.dart';
import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/sign_in.dart';
import 'package:flutter_ecoscore/widget/button.dart';
import 'package:flutter_ecoscore/widget/form.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text('Let\'s Create Your Account',
                style: regularTextStyle.copyWith(
                    fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),

            // Email Input Field
            CustomForm(title: 'Your Emai'),
            SizedBox(height: 10.0),

            // Password Input Field
            CustomForm(
              title: 'Your Password',
              obscureText: true,
            ),
            SizedBox(height: 20.0),

            // Checkbox for Terms and Conditions
            Row(
              children: <Widget>[
                Checkbox(
                  shape: CircleBorder(side: BorderSide(color: greyColor)),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Flexible(
                  child: Wrap(children: [
                    Text('I agree with ',
                    style: regularTextStyle,
                    overflow: TextOverflow.visible),
                    CustomTextButton(
                      title: 'privacy policy ',
                      onTap: () {},
                    ),
                    Text(' and ',
                    style: regularTextStyle,),
                    CustomTextButton(
                      title: 'terms and conditions',
                      onTap: () {},
                    )
                  ]),
                ),
              ],
            ),
            SizedBox(height: 30.0),

            // Sign Up Button
            CustomFilledButton(
              title: 'Create Account',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DietPreferenceScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),

            // Already Have an Account? Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have an account?'),
                SizedBox(width: 10.0),
                CustomTextButton(
                  title: 'sign in',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
