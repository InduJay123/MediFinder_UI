import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: MediaQuery.of(context).size.width* 0.35,
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
          const SizedBox(
            height: 6,
          ),
        ],
      ),
      
    );
  }
}
