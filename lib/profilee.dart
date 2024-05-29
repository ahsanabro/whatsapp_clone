import 'package:flutter/material.dart';

class Profilee extends StatelessWidget {
  final String profilePicture;

  Profilee({required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Picture'),
      ),
      body: Center(
        child: Image.asset(
          profilePicture,
          width: 130,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Handle chat action
              },
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                // Handle voice call action
              },
            ),
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {
                // Handle video call action
              },
            ),
            IconButton(
              icon: Icon(Icons.report),
              onPressed: () {
                // Handle report action
              },
            ),
          ],
        ),
      ),
    );
  }
}
