import 'package:flutter/material.dart';

class ProfilePictureScreen extends StatelessWidget {
  final String avatarUrl;

  const ProfilePictureScreen({Key? key, required this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Picture'),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: avatarUrl.isNotEmpty
              ? AssetImage(avatarUrl)
              : AssetImage(
                  'assets/default_avatar.png'), // Provide a default avatar image if avatarUrl is empty
        ),
      ),
    );
  }
}
