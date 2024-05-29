import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CommunityCard(name: 'Community 1'),
        CommunityCard(name: 'Community 2'),
        CommunityCard(name: 'Community 3'),
        CommunityCard(name: 'Community 4'),
        CommunityCard(name: 'Community 5'),
      ],
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String name;

  const CommunityCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        onTap: () {
          // Add your logic here to navigate to the selected community
        },
      ),
    );
  }
}
