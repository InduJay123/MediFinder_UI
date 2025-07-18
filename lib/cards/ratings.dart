import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';

class RatingsCard extends StatelessWidget {
  const RatingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.star,
              size: 20,
              color: starColor,
            ),
            const Icon(
              Icons.star,
              size: 20,
              color: starColor,
            ),
            const Icon(
              Icons.star,
              size: 20,
              color: starColor,
            ),
            const Icon(
              Icons.star,
              size: 20,
              color: starColor,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: starSecColor,
            ),
          ],
    );
  }
}
