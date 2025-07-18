import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/pages/emergency_page.dart';
import 'package:medi_finder_user_home_page/pages/history_page.dart';
import 'package:medi_finder_user_home_page/pages/home2.dart';
import 'package:medi_finder_user_home_page/pages/user_chat_page_2.dart';
import 'package:medi_finder_user_home_page/pages/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const UserHomePage2(),
    UserChatPage2(),
    HistoryPage(),
    AmbulancePage(),
    UserProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.airport_shuttle),label: "Emergency"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
        ),
        body: _pages[_currentIndex],
      ),

    );
  }
}
