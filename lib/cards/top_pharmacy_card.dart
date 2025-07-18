import 'package:flutter/material.dart';

class TopPharmacyCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TopPharmacyCard({
    super.key,
    required this.title,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02),
          spreadRadius: 1,
          blurRadius: 8,
          offset: Offset(0, 0.5),
        ),
        ]
      ),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: MediaQuery.of(context).size.width* 0.38,
            height: MediaQuery.of(context).size.height* 0.10,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(title,style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),),

        ],
      ),

    );
  }
}
