import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final bool obscureText;
  const CustomForm({
    Key? key,
    required this.title,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          labelStyle: regularTextStyle,
          labelText: title,
        ),
        obscureText: obscureText);
  }
}
