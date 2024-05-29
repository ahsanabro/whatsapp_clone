import 'package:flutter/material.dart';
import 'account_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Settings'),
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.green),
            title: const Text('Account'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountSettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.green),
            title: const Text('Privacy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.green),
            title: const Text('Avatar'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.green),
            title: const Text('Chats'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.data_usage, color: Colors.green),
            title: const Text('Data and storage usage'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.green),
            title: const Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.green),
            title: const Text('Invite a friend'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.system_update, color: Colors.green),
            title: const Text('App updates'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
