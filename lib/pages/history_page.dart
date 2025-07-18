import 'package:flutter/material.dart';

import '../colors.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, dynamic>> searchHistory = [
    {
      'medicineName': 'Paracetamol',
      'imageUrl': 'assets/img1.jpeg', // Placeholder image URL
      'searchedAt': DateTime.now().subtract(Duration(hours: 2)),
      'availability': true,
    },
    {
      'medicineName': 'Acetaminophen.',
      'imageUrl': 'assets/category/capsule1.jfif', // Placeholder image URL
      'searchedAt': DateTime.now().subtract(Duration(hours: 2)),
      'availability': true,
    },
    {
      'medicineName': 'Ibuprofen',
      'imageUrl': 'assets/img2.jpeg', // Placeholder image URL
      'searchedAt': DateTime.now().subtract(Duration(days: 1)),
      'availability': false,
    },
  ];

  void _deleteHistoryItem(int index) {
    setState(() {
      searchHistory.removeAt(index);
    });
  }

  void _clearHistory() {
    setState(() {
      searchHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:chatAppBarColor,
        title: Text('Search History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearHistory,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: searchHistory.length,
        itemBuilder: (context, index) {
          final item = searchHistory[index];
          return Dismissible(
            key: Key(item['medicineName']),
            onDismissed: (direction) {
              _deleteHistoryItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item['medicineName']} deleted")),
              );
            },
            background: Container(color: Colors.red),
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Image.asset(item['imageUrl']),
                title: Text(
                  item['medicineName'],
                  style: TextStyle(
                    color: historyMedicineNameColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Searched on: ${item['searchedAt'].toLocal()} \nAvailability: ${item['availability'] ? "Available" : "Not Available"}',
                ),
                onTap: () {
                  // Navigate to a detailed view or perform another action
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
