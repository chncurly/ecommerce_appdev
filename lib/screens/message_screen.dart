import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> fakeMessages = [
      {
        "sender": "Christian John G. Arnidoval",
        "message": "Im Very Satisfied on the product",
        "time": "Just now"
      },
      {
        "sender": "Gienella G. Dizon",
        "message": "Is Ysl Shoes Size 37 are Available?",
        "time": "2h ago"
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 32, 32),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 51, 50),
        foregroundColor: Colors.white,
        title: const Text('Inbox'),
      ),
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('ysl5.png'), 
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black87,
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            itemCount: fakeMessages.length,
            itemBuilder: (context, index) {
              final msg = fakeMessages[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 232, 41, 28),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        msg['sender']!,
                        style: const TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      Text(
                        msg['time']!,
                        style: const TextStyle(color: Colors.white38, fontSize: 11),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      msg['message']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ),
                  onTap: () {
                  },
                ),
              );
            },
          ),
          
  
          Positioned(
            bottom: 30,
            right: -20,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pns.png',
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}