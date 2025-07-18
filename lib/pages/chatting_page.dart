import 'package:flutter/material.dart';

import '../colors.dart';

void main() => runApp(const MaterialApp(home: ChatPage()));

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    final String message = _controller.text;
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({'text': message, 'isSentByMe': true});
    });

    _controller.clear();

    // Simulate an automatic reply after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({'text': _getAutomaticReply(message), 'isSentByMe': false});
      });
    });
  }

  String _getAutomaticReply(String message) {
    // Customize the automatic reply logic here
    if (message.toLowerCase().contains('hello')) {
      return 'Hi there! How can I assist you today?';
    } else if (message.toLowerCase().contains('medicine')) {
      return 'What medicine are you looking for?';
    } else {
      return 'I am here to help!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chats",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height* 0.12,
          backgroundColor: chatAppBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Chat messages list
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return _buildChatBubble(message['text'], message['isSentByMe']);
                  },
                ),
              ),
              // Text input field and send button
              _buildInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(String message, bool isSentByMe) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSentByMe
              ? const Color.fromARGB(255, 47, 243, 33)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByMe
                ? const Color.fromARGB(255, 25, 2, 2)
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.photo,
              color: Color.fromARGB(255, 7, 70, 4),
              size: 35,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 184, 245, 116), // Border color
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 184, 245, 116),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 184, 245, 116),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _sendMessage,
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.send,
              color: Color.fromARGB(255, 7, 70, 4),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
