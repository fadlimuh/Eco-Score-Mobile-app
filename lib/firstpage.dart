import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/sign_in.dart'; // Assuming this imports the SignInScreen
import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/sign_up.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/firstpage.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Welcome to Eco-Score',
                        textAlign: TextAlign.left,
                        style: blackTextStyle.copyWith(
                            fontSize: 25, fontWeight: bold )),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        'Eco-Score helps to scan food products to get clear information on the health impact of the products you consume.',
                        textAlign: TextAlign.left,
                        style: regularTextStyle.copyWith()),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'What\'s your name?',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                  ),
                  style: regularTextStyle,
                  maxLength: 30,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 60, 50.0),
                    maximumSize:
                        Size(MediaQuery.of(context).size.width - 60, 50.0),
                    backgroundColor: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: regularTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ));
                    },
                    child: Text(
                      'Sign in',
                      style: regularTextStyle.copyWith(
                          color: redColor, fontWeight: bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
