import 'package:flutter/material.dart';
import '../colors.dart';
import '../data/chat_pharmacy_data.dart';
import 'chatting_page.dart';
//import 'package:myapp_1/widgets/shared/button_click.dart';


class UserChatPage2 extends StatefulWidget {
  const UserChatPage2({super.key});

  @override
  State<UserChatPage2> createState() => _UserChatPage2State();
}

class _UserChatPage2State extends State<UserChatPage2> {
  final chatPharmacyList = ChatPharmacyData().chatPharmacyList;
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
                      height: MediaQuery.of(context).size.height* 0.22,
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
                      height: MediaQuery.of(context).size.height* 0.57,
                    ),
                    const SizedBox(height: 12),

                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the chat page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatPage()), // Replace ChatPage() with your chat page widget
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 30, 233, 108),
                      ),
                      child: const Text(
                        'Chat with Pharmacy',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )

                  ]
              ),
            )
        )
    );
  }
}
