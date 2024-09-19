import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';
import 'package:flutter_ecoscore/sign_up.dart';
import 'diet2.dart';

void main() => runApp(EcoScoreApp());

class EcoScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DietPreferenceScreen(),
    );
  }
}

class DietPreferenceScreen extends StatefulWidget {
  @override
  _DietPreferenceScreenState createState() => _DietPreferenceScreenState();
}

class _DietPreferenceScreenState extends State<DietPreferenceScreen> {
  List<String> allergies = [
    'Eggs',
    'Fruits',
    'Nuts',
    'Spices',
    'Gluten',
    'Honey',
    'Dairy',
    'No Allergies',
    'Others'
  ];

  List<String> selectedAllergies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Image.asset('assets/images/diet2.jpg'),
            SizedBox(height: 20.0),
            Text(
              'Hi, Novaria Nita! Tell Us About Your Food Allergies',
              style: regularTextStyle,
            ),
            SizedBox(height: 10.0),
            Text(
              'We’ll adapt your recommendations to your preferences',
              style: regularTextStyle
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: allergies.length,
                itemBuilder: (context, index) {
                  return AllergyOption(
                    allergy: allergies[index],
                    isSelected: selectedAllergies.contains(allergies[index]),
                    onTap: () {
                      setState(() {
                        if (selectedAllergies.contains(allergies[index])) {
                          selectedAllergies.remove(allergies[index]);
                        } else {
                          selectedAllergies.add(allergies[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietPreferenceScreen2()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AllergyOption extends StatelessWidget {
  final String allergy;
  final bool isSelected;
  final VoidCallback onTap;

  AllergyOption(
      {required this.allergy, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300, // Lebar 300
        height: 90, // Tinggi 90
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.green.withOpacity(0.2)
              : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.green : Colors.grey,
            ),
            SizedBox(width: 10.0),
            Text(
              allergy,
              style: regularTextStyle
            ),
          ],
        ),
      ),
    );
  }
}
