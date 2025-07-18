import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';
import 'package:medi_finder_user_home_page/cards/ratings.dart';

import '../cards/review_card.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<ReviewCard> _reviews = [];

  void _addReview() {
    final String title = _titleController.text;
    final String description = _descriptionController.text;

    if (title.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _reviews.add(ReviewCard(
          reviewTitle: title,
          reviewDescription: description,
          reviewImageUrl: 'assets/review_image.png', // Replace with your image path
          reviewTime: 'Just now',
        ));
      });

      _titleController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Your Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addReview,
                child: Text('Send'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appBarBgColor, // Button color
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _reviews.length,
                  itemBuilder: (context, index) {
                    return _reviews[index];
                  },
                ),
              ),
            ],
          )
          );

  }
}
