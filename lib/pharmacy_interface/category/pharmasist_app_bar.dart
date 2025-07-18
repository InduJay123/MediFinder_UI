import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';

Widget appBarAction = Padding(
  padding: const EdgeInsets.all(5.0),
  child: Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: locationIconBgColor
    ),
    child: const Center(
        child:Icon(
          Icons.add_location_alt,
          color: Colors.white,
          size: 34,
        )
    ),
  ),
);

Widget appBarTitle = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("456, Main st, Colombo 4",style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: userNameColor,
    ),
    ),
    const Text("Hello, Crystal Pharma",style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),),
  ],
);

