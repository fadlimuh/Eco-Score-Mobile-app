import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? buttonColor;
  const CustomTextButton({Key? key, required this.title, required this.onTap,this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: regularTextStyle.copyWith(color: buttonColor??redColor),
      ),
    );
  }
}

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CustomFilledButton({Key? key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: blackColor),
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    title,
                    style: whiteTextStyle,
                  ),
                ),
              ),
            );
  }
}

class CustomButtomSearch extends StatelessWidget {

  const CustomButtomSearch({Key? key});

  @override
  Widget build(BuildContext context) {
    return
    TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            );
  }
}