import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapppppp/settings_screen.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final List<StatusUpdate> statusUpdates = [
    StatusUpdate(
      userName: 'Haseeb Memon',
      timeAgo: '1 hour ago',
      thumnail: MediaType.image,
      thumnailurl: 'https://picsum.photos/200/300',
      mediaUrl: '2RQGJXjaCaA', // Example YouTube video URL
      mediaType: MediaType.video,
    ),
    StatusUpdate(
      userName: 'Jane Smith',
      timeAgo: '3 hours ago',
      thumnail: MediaType.image,
      thumnailurl: 'https://picsum.photos/200/300',
      mediaUrl: 'https://picsum.photos/300/200', // Example image URL
      mediaType: MediaType.image,
    ),
    StatusUpdate(
      userName: 'Alex Johnson',
      timeAgo: '5 hours ago',
      thumnail: MediaType.text,
      thumnailurl: 'https://picsum.photos/200/300',
      mediaUrl:
          'https://example.com/your_text_status_url', // Example text status URL
      mediaType: MediaType.text,
    ),
  ];

  void _openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the selected image
      print('Camera image path: ${image.path}');
    }
  }

  void _showSearch() {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }

  void _showMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: 'settings',
          child: Text('Settings'),
        ),
      ],
    ).then((value) {
      if (value == 'settings') {
        // Navigate to the Settings screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Adjust the color based on your theme
        title: const Text('Updates'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _openCamera,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearch,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _showMenu,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: statusUpdates.length,
        itemBuilder: (context, index) {
          final statusUpdate = statusUpdates[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(statusUpdate.mediaUrl),
            ),
            title: Text(statusUpdate.userName),
            subtitle: Text(statusUpdate.timeAgo),
            onTap: () {
              // Handle status update tap
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openCamera,
        child: const Icon(Icons.camera_alt),
        backgroundColor: Colors.green,
      ),
    );
  }
}

enum MediaType {
  image,
  video,
  text,
}

class StatusUpdate {
  final String userName;
  final String timeAgo;
  final String mediaUrl;
  final MediaType mediaType;
  final MediaType thumnail;
  final String thumnailurl;

  StatusUpdate({
    required this.userName,
    required this.timeAgo,
    required this.mediaUrl,
    required this.mediaType,
    required this.thumnail,
    required this.thumnailurl,
  });
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search result based on the query
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions based on the query
    return Container();
  }
}
