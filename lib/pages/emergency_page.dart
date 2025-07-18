import 'package:flutter/material.dart';

import '../colors.dart';

class AmbulancePage extends StatefulWidget {
  @override
  _AmbulancePageState createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  String? _selectedDistrict;

  final List<String> _districts = [
    'Ampara',
    'Anuradhapura',
    'Badulla'
    'Colombo',
    'Galle',
    'Gampaha',
    'Hambanthota',
    'Jaffna',
    'Kaluthara'
    'Kandy',
    'Kegalle'
    'Kurunegala',
    'Madakalapuwa',
    'Matara',
    'Matale',
    'Monaragala',
    'Mulathiw',
    'Nuwaraeliya',
    'Polonnaruwa',
    'Ratnapura',
    'Tincomalee',
    'Wawniya'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Emergency/img6.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppBar(
                  toolbarHeight: MediaQuery.of(context).size.height * 0.55,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Your District:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedDistrict,
                    items: _districts.map((String district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDistrict = newValue;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(12),
                    ),
                    hint: const Text('Choose District'),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_selectedDistrict != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Searching for ambulance details in $_selectedDistrict'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a district first.'),
                            ),
                          );

                        }
                      },
                      icon: const Icon(Icons.call,
                        color: Colors.black,
                      ),
                      label: const Text('Call for Ambulance',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),),
                      style: ElevatedButton.styleFrom(
                         backgroundColor : locationIconBgColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
