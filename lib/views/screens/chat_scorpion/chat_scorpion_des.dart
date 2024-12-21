import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gimnasio_escorpion/views/widgets/custom_text.dart';

class ChatScorpionDes extends StatelessWidget {
  const ChatScorpionDes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Scorpion Bro".tr,),),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                ChatBubble(
                  text: "Do you know what time is it?",
                  isSentByMe: false,
                  time: "10:15",
                ),
                ChatBubble(
                  text: "It’s morning in Tokyo 😎",
                  isSentByMe: true,
                  time: "10:15",
                ),
                ChatBubble(
                  text: "What is the most popular meal in Japan?",
                  isSentByMe: false,
                  time: "11:40",
                ),
                ChatBubble(
                  text: "Do you like it?",
                  isSentByMe: false,
                  time: "11:40",
                ),
                ChatBubble(
                  text: "I think top two are",
                  isSentByMe: true,
                  time: "11:40",
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String time;

  ChatBubble({required this.text, required this.isSentByMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [

        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSentByMe ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: isSentByMe ? Radius.circular(12) : Radius.zero,
              bottomRight: isSentByMe ? Radius.zero : Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSentByMe ? Colors.white : Colors.black87,
              fontSize: 16,
            ),
          ),
        ),
        if (!isSentByMe) ...[
          const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 5),
        ],
        Text(
          time,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
