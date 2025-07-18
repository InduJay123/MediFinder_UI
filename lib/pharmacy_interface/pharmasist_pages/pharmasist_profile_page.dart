import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../colors.dart';

class PharmacistProfilePage extends StatefulWidget {
  @override
  _PharmacistProfilePageState createState() => _PharmacistProfilePageState();
}

class _PharmacistProfilePageState extends State<PharmacistProfilePage> {
  String? _profilePicture;

  /*Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profilePicture = pickedFile.path;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pharmacist Profile',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: locationIconBgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*GestureDetector(
              onTap: //_pickImage,
               CircleAvatar(
                radius: 60,
                backgroundImage: /*_profilePicture != null
                    ? FileImage(File(_profilePicture!))
                    : */const AssetImage('assets/img1.png') as ImageProvider,
                child: _profilePicture == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[700])
                    : null,
              ),*/
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/logo/img1.jpeg",
                width: MediaQuery.of(context).size.width* 0.39,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height* 0.19,
                
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Crystal Pharma',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'user.crystal@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {
                setState(() {
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 184, 245, 116),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pharmacy Information',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const ListTile(title: Text('Pharmasist Name: Nurash Hemawansha')),
            const ListTile(title: Text('Contact Number: +94 123456789')),
            const ListTile(title: Text('Pharmacy: Cristal Pharma')),
            const ListTile(title: Text('Location: No:456, Main street, Colombo 04')),
            const SizedBox(height: 16),
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
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Edit profile logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:locationIconBgColor,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ]
        ),
    ),
    );
  }
}
