import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';
import 'package:medi_finder_user_home_page/pages/chatting_page.dart';
import 'package:medi_finder_user_home_page/pages/history_page.dart';
import 'package:medi_finder_user_home_page/pages/user_chat_page.dart';
import 'package:medi_finder_user_home_page/pages/user_home_page.dart';
import 'package:medi_finder_user_home_page/pages/user_profile_page.dart';

class SideMenuu extends StatefulWidget {
  const SideMenuu({super.key});

  @override
  State<SideMenuu> createState() => _SideMenuuState();
}

class _SideMenuuState extends State<SideMenuu> {
  List<bool> _isSelected = List<bool>.filled(6, false);

  void _changeTextColor(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Yuma Tashli",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            accountEmail: const Text(
              "user.email@example.com",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/review/review3.jfif"),
              ),
            ),
            decoration: const BoxDecoration(
              color: bannerSecColor,
              image: DecorationImage(
                image: AssetImage("assets/pimg3.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _changeTextColor(0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserHomePage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.home,color: _isSelected[0] ? Colors.green : Colors.black,),
              title: Text(
                "DashBoard",
                style: TextStyle(
                    color: _isSelected[0] ? Colors.green : Colors.black,
                    fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _changeTextColor(1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.person,color: _isSelected[1] ? Colors.green : Colors.black,),
              title: Text(
                "Profile",
                style: TextStyle(
                    color: _isSelected[1] ? Colors.green : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _changeTextColor(2);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserChatPage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.chat,color: _isSelected[2] ? Colors.green : Colors.black,),
              title: Text(
                "Chat",
                style: TextStyle(
                    color: _isSelected[2] ? Colors.green : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _changeTextColor(3);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.history,color: _isSelected[3] ? Colors.green : Colors.black,),
              title: Text(
                "History",
                style: TextStyle(
                    color: _isSelected[3] ? Colors.green : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _changeTextColor(4);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.help,color: _isSelected[4] ? Colors.green : Colors.black,),
              title: Text(
                "Help",
                style: TextStyle(
                    color: _isSelected[4] ? Colors.green : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              _changeTextColor(5);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.logout,color: _isSelected[5] ? Colors.green : Colors.black,),
              title: Text(
                "SignOut",
                style: TextStyle(
                    color: _isSelected[5] ? Colors.green : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
