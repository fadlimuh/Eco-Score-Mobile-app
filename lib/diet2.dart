import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';
import 'diet1.dart';
import 'diet3.dart';

class DietPreferenceScreen2 extends StatefulWidget {
  @override
  _DietPreferenceScreen2State createState() => _DietPreferenceScreen2State();
}

class _DietPreferenceScreen2State extends State<DietPreferenceScreen2> {
  List<String> allergies = [
    'Fragrance',
    'Retinol',
    'Paraben',
    'Salicylic Acid',
    'AHA BHA',
    'Niacinamide',
    'Vitamin C',
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
              'Hi, Novaria Nita! Tell Us About Your Skincare Allergies',
              style: regularTextStyle
            ),
            SizedBox(height: 20.0),
            Text(
              'So we can give you a warning on the product',
              style: regularTextStyle
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: allergies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: AllergyOption(
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
                    ),
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
                    icon: Icon(Icons.arrow_back, color: Colors.white), // Ubah warna panah menjadi putih
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.white), // Ubah warna panah menjadi putih
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreferencesPage()),
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

  AllergyOption({required this.allergy, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300, // Lebar 300
        height: 90, // Tinggi 90
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.2) : Colors.white.withOpacity(0.2),
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
