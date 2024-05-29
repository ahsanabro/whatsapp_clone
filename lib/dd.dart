import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ChatList(),
    StatusScreen(),
    CommunityScreen(),
    CallsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('WhatsApp'),
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'Settings':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                  break;
                default:
                  // Handle other options
                  print("Selected: $value");
              }
            },
            itemBuilder: (BuildContext context) {
              return {
                'New group',
                'New broadcast',
                'Linked devices',
                'Starred messages',
                'Settings',
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final List<Chat> chats = [
    Chat(
      name: 'Haseeb Memon',
      message: 'Hey, how are you?',
      time: '10:30 AM',
      profilePicture: 'assets/hh.png',
      lastSeen: 'last seen today at 9:30 AM',
    ),
    Chat(
      name: 'Hassan Lashari',
      message: 'aja hotel bethe ',
      time: '9:00 AM',
      profilePicture: 'assets/h.png',
      lastSeen: 'last seen today at 9:30 AM',
    ),
    Chat(
      name: 'Ameer',
      message: 'kal tak ajaonga',
      time: '8:45 AM',
      profilePicture: 'assets/a.png',
      lastSeen: 'last seen yesterday at 8:00 PM',
    ),
    Chat(
      name: 'Mansoor korejo',
      message: 'Hey, how are you?',
      time: '10:30 AM',
      profilePicture: 'assets/m.png',
      lastSeen: 'last seen today at 11:00 AM',
    ),
    // Add more chats as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ask Meta AI or Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: Text('All'),
                  onSelected: (bool value) {},
                  selected: true,
                  selectedColor: Colors.green[100],
                ),
                FilterChip(
                  label: Text('Unread'),
                  onSelected: (bool value) {},
                  selected: false,
                  selectedColor: Colors.green[100],
                ),
                FilterChip(
                  label: Text('Groups'),
                  onSelected: (bool value) {},
                  selected: false,
                  selectedColor: Colors.green[100],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat.profilePicture),
                    backgroundColor: Colors.green,
                    radius: 20,
                    child: Text(chat.name[0]),
                  ),
                  title: Text(chat.name),
                  subtitle: Text(chat.message),
                  trailing: Text(chat.time),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(chat: chat),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new chat creation
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final Chat chat;

  ChatScreen({required this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chat.name,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              widget.chat.lastSeen,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, color: Colors.green),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle the selected option
              print("Selected: $value");
            },
            itemBuilder: (BuildContext context) {
              return {
                'New group',
                'New broadcast',
                'Linked devices',
                'Starred messages',
                'Settings'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.more_vert, color: Colors.green),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(messages[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;
  final String profilePicture;
  final String lastSeen;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.profilePicture,
    required this.lastSeen,
  });
}

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final List<StatusUpdate> statusUpdates = [
    StatusUpdate(
      userName: 'John Doe',
      timeAgo: '1 hour ago',
      mediaUrl:
          'https://www.youtube.com/watch?v=your_youtube_video_id', // Example YouTube video URL
      mediaType: MediaType.video,
    ),
    StatusUpdate(
      userName: 'Jane Smith',
      timeAgo: '3 hours ago',
      mediaUrl: 'https://picsum.photos/300/200', // Example image URL
      mediaType: MediaType.image,
    ),
    StatusUpdate(
      userName: 'Alex Johnson',
      timeAgo: '5 hours ago',
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

  StatusUpdate({
    required this.userName,
    required this.timeAgo,
    required this.mediaUrl,
    required this.mediaType,
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

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Community Screen'),
    );
  }
}

class CallsScreen extends StatelessWidget {
  final List<Call> calls = [
    Call(
      name: 'John Doe',
      time: 'Yesterday, 10:30 PM',
      callType: CallType.video,
      callStatus: CallStatus.missed,
    ),
    Call(
      name: 'Jane Smith',
      time: 'Yesterday, 5:20 PM',
      callType: CallType.voice,
      callStatus: CallStatus.received,
    ),
    Call(
      name: 'Alex Johnson',
      time: 'Yesterday, 2:10 PM',
      callType: CallType.video,
      callStatus: CallStatus.dialed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                call.callType == CallType.voice ? Icons.call : Icons.video_call,
                color: Colors.white,
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

  Call({
    required this.name,
    required this.time,
    required this.callType,
    required this.callStatus,
  });
}
