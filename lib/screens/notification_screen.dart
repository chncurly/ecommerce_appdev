import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 232, 41, 28),
        foregroundColor: Colors.white,
        title: const Text('Ka-Basic Stories'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
                icon: const Icon(Icons.shopping_bag),
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MessageScreen()),
              );
            },
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: Stack(
        children: [
  
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgroun2.png'), 
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.07), 
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "WEAR THE STORY",
                          style: TextStyle(
                            color: Color.fromARGB(255, 232, 41, 28),
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "ESTABLISHED 2018",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        const Text(
                          "The journey of Plain & Simple (P&S) began with a frustration that many shared: the search for the 'perfect' basic tee. We realized that in a world of fast fashion, the essence of quality was being lost."
                          "\n\n"
                          "We didn't just want to sell clothes; we wanted to create a uniform for the dreamers, the doers, and the 'Ka-Basics' who find beauty in simplicity. Every stitch and every fabric choice is a testament to our commitment to you."
                          "\n\n"
                          "Whether you're hitting the streets or just lounging, P&S is designed to move with you. No loud logos, no distractions—just you and your style.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            height: 1.8,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        
                        const SizedBox(height: 40),
                        const Divider(color: Colors.white10),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "ALWAYS WEAR THE BASIC!",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}