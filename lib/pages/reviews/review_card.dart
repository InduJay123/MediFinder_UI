import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';
import 'package:medi_finder_user_home_page/pages/reviews/ratings.dart';

class ReviewCard extends StatelessWidget {
  final String reviewTitle;
  final String reviewDescription;
  final String reviewImageUrl;
  final String reviewTime;
  const ReviewCard({
    super.key,
    required this.reviewTitle,
    required this.reviewDescription,
    required this.reviewImageUrl,
    required this.reviewTime
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 100,
        height: 130,
        decoration: BoxDecoration(
          color: appBarBgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    reviewImageUrl,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 70,
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(reviewTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: reviewTitleColor,
                    fontWeight: FontWeight.w500,
                  ),),
                  Row(
                    children: [
                      Text(reviewTime,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),),
                      RatingsCard()
                    ],
                  ),
                  SizedBox(
                    width: 190,
                    child: Text(reviewDescription,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

