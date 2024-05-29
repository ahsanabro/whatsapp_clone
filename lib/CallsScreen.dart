import 'package:flutter/material.dart';
import 'ProfilePictureScreen.dart'; // Import the ProfilePictureScreen class

class CallsScreen extends StatelessWidget {
  final List<Call> calls = [
    Call(
      name: 'Haseeb Memon',
      time: 'Yesterday, 10:30 PM',
      callType: CallType.video,
      callStatus: CallStatus.missed,
      avatarUrl: 'assets/hh.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Haseeb Memon',
      time: 'Yesterday, 10:30 PM',
      callType: CallType.video,
      callStatus: CallStatus.missed,
      avatarUrl: 'assets/h.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Hassan Raza',
      time: 'Yesterday, 5:20 PM',
      callType: CallType.voice,
      callStatus: CallStatus.received,
      avatarUrl: 'assets/h.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Ameer Abro',
      time: 'Yesterday, 2:10 PM',
      callType: CallType.video,
      callStatus: CallStatus.dialed,
      avatarUrl: 'assets/a.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'meer mansoor',
      time: 'Yesterday, 2:10 PM',
      callType: CallType.video,
      callStatus: CallStatus.dialed,
      avatarUrl: 'assets/m.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Haseeb Memon',
      time: 'Yesterday, 10:30 PM',
      callType: CallType.video,
      callStatus: CallStatus.missed,
      avatarUrl: 'assets/hh.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Haseeb Memon',
      time: 'Yesterday, 10:30 PM',
      callType: CallType.video,
      callStatus: CallStatus.missed,
      avatarUrl: 'assets/h.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Hassan Raza',
      time: 'Yesterday, 5:20 PM',
      callType: CallType.voice,
      callStatus: CallStatus.received,
      avatarUrl: 'assets/h.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'Ameer Abro',
      time: 'Yesterday, 2:10 PM',
      callType: CallType.video,
      callStatus: CallStatus.dialed,
      avatarUrl: 'assets/a.png', // Change this to the actual path of the image
    ),
    Call(
      name: 'meer mansoor',
      time: 'Yesterday, 2:10 PM',
      callType: CallType.video,
      callStatus: CallStatus.dialed,
      avatarUrl: 'assets/m.png', // Change this to the actual path of the image
    ),
    // Add more calls here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilePictureScreen(avatarUrl: call.avatarUrl),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: AssetImage(call.avatarUrl),
              ),
            ),
            title: Text(call.name),
            subtitle: Row(
              children: [
                Icon(
                  call.callStatus == CallStatus.missed
                      ? Icons.call_missed
                      : Icons.call_received,
                  color: call.callStatus == CallStatus.missed
                      ? Colors.red
                      : Colors.green,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(call.time),
              ],
            ),
            onTap: () {
              // Handle call item tap
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new call creation
        },
        child: Icon(Icons.add_call),
        backgroundColor: Colors.green,
      ),
    );
  }
}

enum CallType {
  voice,
  video,
}

enum CallStatus {
  missed,
  received,
  dialed,
}

class Call {
  final String name;
  final String time;
  final CallType callType;
  final CallStatus callStatus;
  final String avatarUrl;

  Call({
    required this.name,
    required this.time,
    required this.callType,
    required this.callStatus,
    required this.avatarUrl,
  });
}
