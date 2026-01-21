import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/notification_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    HomeScreen(),
    ShopScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
    color: const Color.fromARGB(255, 255, 255, 255),
    border: Border(
      top: BorderSide(color: Colors.white, width: 1),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 6,
        offset: Offset(0, -2), 
      ),
    ],
    
  ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,

          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 54, 47, 46), 
          unselectedItemColor: Colors.grey.shade900,
        
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Story',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
