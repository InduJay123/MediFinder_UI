//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? _profilePicture;
  bool _showPersonalInfo = false;
  bool _showMedicalInfo = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile', style: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600)),
        backgroundColor:chatAppBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/review/review3.jfif",
                  width: MediaQuery.of(context).size.width* 0.39,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height* 0.19,

                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Yuma Tashli',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'yumatexample@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 26),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showPersonalInfo = !_showPersonalInfo;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 184, 245, 116),
                  minimumSize: const Size(
                      double.infinity, 50), // Increase button width and height
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      _showPersonalInfo ? Icons.arrow_drop_down : Icons
                          .arrow_drop_down,
                      // Toggle icon based on _showPersonalInfo state
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              if (_showPersonalInfo)
                const Column(
                  children: [
                    ListTile(title: Text('Name: Yuma Tashli')),
                    ListTile(title: Text('Age: 30')),
                    ListTile(title: Text('Contact Number: +94 123456789')),
                    ListTile(title: Text('Address: 123 Main St, Galle')),
                  ],
                ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showMedicalInfo = !_showMedicalInfo;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 184, 245, 116),
                  minimumSize: const Size(
                      double.infinity, 50), // Increase button width and height
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Medical Information',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      _showMedicalInfo ? Icons.arrow_drop_down : Icons
                          .arrow_drop_down,
                      // Toggle icon based on _showPersonalInfo state
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              if (_showMedicalInfo)
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the chat page

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: locationIconBgColor,
                          ),
                          child: const Text(
                            'Upload Prescriptions',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        ]
                    ),
               ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Sign out logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: locationIconBgColor,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.exit_to_app, color: Colors.black),
                        SizedBox(width: 8),
                        // Adjust the spacing between the icon and text as needed
                        Text(
                          'Sign Out',
                          style: TextStyle(fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Sign out logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: locationIconBgColor,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, color: Colors.black),
                        SizedBox(width: 8),
                        // Adjust the spacing between the icon and text as needed
                        Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}