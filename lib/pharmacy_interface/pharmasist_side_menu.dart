import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/colors.dart';

class PharmasistSideMenu extends StatefulWidget {
  const PharmasistSideMenu({super.key});

  @override
  State<PharmasistSideMenu> createState() => _PharmasistSideMenuState();
}

class _PharmasistSideMenuState extends State<PharmasistSideMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Crystal Pharma",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20
              ),),
              accountEmail: const Text("user.crystal@gmail.com",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18),),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("assets/pimg4.jpeg"),
                ),
              ),
              decoration: const BoxDecoration(
                  color: bannerSecColor,
                  image: DecorationImage(
                      image: AssetImage("assets/pimg2.jpeg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            ListTile(leading: Icon(Icons.home),
              title: Text("DashBoard"),
              onTap: () => print("Dashboard"),
            ),
            ListTile(leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => print("Profile"),
            ),
            ListTile(leading: Icon(Icons.chat),
              title: Text("Chat"),
              onTap: () => print("Chat"),
            ),
            ListTile(leading: Icon(Icons.history),
              title: Text("History"),
              onTap: () => print("History"),
            ),
            ListTile(leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: () => print("Help"),
            ),
            ListTile(leading: Icon(Icons.logout),
              title: Text("SignOut"),
              onTap: () => print("SignOut"),
            ),
          ]
      ),
    );
  }
}
