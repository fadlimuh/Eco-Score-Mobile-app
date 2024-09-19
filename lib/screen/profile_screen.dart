import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunciton1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunciton2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunciton3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: regularTextStyle,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: regularTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                ),
                buildcAcountOption(BuildContext, 'Change Account'),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildcAcountOption(BuildContext, 'Change Diet Preferences'),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildcAcountOption(BuildContext, 'Favourite Product'),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildcAcountOption(BuildContext, 'Log out'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Notifications',
                  style: regularTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildNotificationoption(
                    'Send Me Notifications', valNotify1, onChangeFunciton1),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Reminders',
                  style: regularTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildNotificationoption(
                    'Daily Log', valNotify2, onChangeFunciton2),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildcAcountOption(BuildContext, 'Reminder Time'),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Support',
                  style: regularTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                buildcAcountOption(BuildContext, 'Email Tech Support'),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
                buildcAcountOption(BuildContext, 'Privacy Policy'),
                Divider(
                  height: 10,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildNotificationoption(
      String title, bool value, Function onChangedMethod) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.black,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangedMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildcAcountOption(BuildContext, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: regularTextStyle.copyWith(fontWeight: FontWeight.w400,
                fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
