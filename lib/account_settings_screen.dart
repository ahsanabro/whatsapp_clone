import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Account'),
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.grey),
            title: const Text('Security notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.key, color: Colors.grey),
            title: const Text('Passkeys'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.grey),
            title: const Text('Email address'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user, color: Colors.grey),
            title: const Text('Two-step verification'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.grey),
            title: const Text('Change number'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.grey),
            title: const Text('Request account info'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.grey),
            title: const Text('Add account'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.grey),
            title: const Text('Delete account'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
