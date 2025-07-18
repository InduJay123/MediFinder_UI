import 'package:flutter/material.dart';
import 'package:medi_finder_user_home_page/models/chat_pharmacy_model.dart';

import '../cards/chat_pharmacy_card.dart';
import '../colors.dart';
import '../data/chat_pharmacy_data.dart';
import 'chatting_page.dart';
//import 'package:myapp_1/widgets/shared/button_click.dart';


class UserChatPage extends StatefulWidget {
  const UserChatPage({super.key});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  final chatPharmacyList = ChatPharmacyData().chatPharmacyList; int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height* 0.19,
                  color: locationIconBgColor,
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Discover Your Top Drugstore",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Just Join with Us!",
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                Image.asset(
                  "assets/chat.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height* 0.40,
                ),
                const SizedBox(height: 10),
                Column(
                    children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.24,
                            child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: chatPharmacyList.length,
                            itemBuilder: (context, index) {
                              ChatPharmacy chatPharmacy = chatPharmacyList[index];
                              bool isSelected = index == selectedIndex;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                      selectedIndex = index;
                                  });
                               },
                              child: ChatPharmacyCard(
                                pharmacyName: chatPharmacy.pharmacyName,
                                openTime: chatPharmacy.openTime,
                                ImageUrl: chatPharmacy.ImageUrl,
                                isSelected: selectedIndex == index,
                              ),
                              );
                            },
                            ),
                        ),
                        ElevatedButton(
                          onPressed: selectedIndex != null
                            ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChatPage()),
                              );
                            }
                            : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedIndex != null
                                ? const Color.fromARGB(255, 30, 233, 108)
                               : Colors.grey,
                              ),
                            child: Text(
                              'Start Now',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                ),
                             ),
                        ),
                    ],
                  )
            ]
          ),
        )
    )
    );
  }
}