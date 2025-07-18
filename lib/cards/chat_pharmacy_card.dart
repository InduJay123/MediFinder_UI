import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';
import 'package:medi_finder_user_home_page/cards/ratings.dart';

class ChatPharmacyCard extends StatelessWidget {
  final String pharmacyName;
  final String openTime;
  final String ImageUrl;
  final bool isSelected;
  const ChatPharmacyCard({
    super.key,
    required this.pharmacyName,
    required this.openTime,
    required this.ImageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.0001),
      child: Container(
        width: MediaQuery.of(context).size.width* 0.9,
        height:MediaQuery.of(context).size.height* 0.10,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : appBarBgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                child: Image.asset(
                  ImageUrl,
                  fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width* 0.4,
                    height:MediaQuery.of(context).size.height* 0.08,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pharmacyName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: reviewTitleColor,
                      fontWeight: FontWeight.w500,
                    ),),
                  Text(openTime,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

