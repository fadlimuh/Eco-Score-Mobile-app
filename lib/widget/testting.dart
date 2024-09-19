import 'package:flutter/material.dart';

class OptionJabatan extends StatefulWidget {
  const OptionJabatan({super.key});

  @override
  State<OptionJabatan> createState() => _OptionJabatanState();
}

class _OptionJabatanState extends State<OptionJabatan> {
  String? pilihjabatan;
  final List<String> jobs = [
    "Software Engineer",
    "Product Manager",
    "Designer"
  ];

  String? selecteditem = "Jabatan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: DropdownButton<String>(
              value: pilihjabatan,
              hint: Text("Jabatan"),
              items: jobs.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  pilihjabatan = newvalue;
                });
              }),
        ),
      ),
    );
  }
}
