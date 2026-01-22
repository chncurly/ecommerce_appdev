import 'package:ecommerce/screens/message_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 32, 32),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 68, 50, 48),
        foregroundColor: Colors.white,
        title: const Text('Profile Settings'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MessageScreen()),
              );
            },
            icon: const Icon(Icons.message_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(''),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(child: Image.asset('ysl.png', width: 150)),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      children: [
                        _buildSettingTile(
                          Icons.person_outline,
                          "Edit Profile",
                          () {},
                        ),
                        const Divider(color: Colors.white10, height: 1),
                        _buildSettingTile(
                          Icons.notifications_none,
                          "Notifications",
                          () {},
                        ),
                        const Divider(color: Colors.white10, height: 1),
                        _buildSettingTile(
                          Icons.lock_outline,
                          "Privacy & Security",
                          () {},
                        ),
                        const Divider(color: Colors.white10, height: 1),
                        _buildSettingTile(
                          Icons.help_outline,
                          "Help & Support",
                          () {},
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Yves Saint Laurent",
                    style: TextStyle(color: Colors.white24, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: const Color.fromARGB(255, 129, 110, 108)),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white24,
        size: 16,
      ),
    );
  }
}
