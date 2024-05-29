import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  final List<Chat> chats = [
    Chat(
      name: 'Haseeb Memon',
      message: 'Hey, how are you?',
      time: '10:30 AM',
      profilePicture: 'assets/hh.png',
      lastSeen: 'Online',
      isUnread: true,
    ),
    Chat(
      name: 'Hassan Lashari',
      message: 'aja hotel bethe ',
      time: '9:00 AM',
      profilePicture: 'assets/h.png',
      lastSeen: 'last seen today at 9:30 AM',
      isUnread: false,
    ),
    Chat(
      name: 'Ameer',
      message: 'kal tak ajaonga',
      time: '8:45 AM',
      profilePicture: 'assets/a.png',
      lastSeen: 'last seen yesterday at 8:00 PM',
      isUnread: true,
    ),
    Chat(
      name: 'Mansoor korejo',
      message: 'Hey, how are you?',
      time: '10:30 AM',
      profilePicture: 'assets/m.png',
      lastSeen: 'last seen today at 11:00 AM',
      isUnread: false,
    ),
    Chat(
      name: 'Asim Abbasi',
      message: 'Hey!',
      time: '2:30 AM',
      profilePicture: 'assets/aba.png',
      lastSeen: 'last seen today at 12:12 AM',
      isUnread: true,
    ),
    Chat(
      name: 'Hardesh Khan',
      message: 'hi',
      time: '1:30 AM',
      profilePicture: 'assets/har.png',
      lastSeen: 'Online',
      isUnread: false,
    ),
    Chat(
      name: 'shumail khatri',
      message: 'plzzz',
      time: 'yesterday at 10:30 AM',
      profilePicture: 'assets/shu.png',
      lastSeen: 'last seen yesterday at 10:30 AM',
      isUnread: true,
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
                  onSelected: (bool value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UnreadChatsScreen(
                          unreadChats:
                              chats.where((chat) => chat.isUnread).toList(),
                        ),
                      ),
                    );
                  },
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
                    backgroundColor: Colors.black,
                    radius: 20,
                    child: Text(chat.name[0]),
                  ),
                  title: Text(
                    chat.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
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

class UnreadChatsScreen extends StatelessWidget {
  final List<Chat> unreadChats;

  UnreadChatsScreen({required this.unreadChats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Unread Chats',
          style: TextStyle(color: Colors.green),
        ),
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: ListView.builder(
        itemCount: unreadChats.length,
        itemBuilder: (context, index) {
          final chat = unreadChats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat.profilePicture),
              backgroundColor: Colors.black,
              radius: 20,
              child: Text(chat.name[0]),
            ),
            title: Text(
              chat.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
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
              style: TextStyle(color: Colors.black),
            ),
            Text(
              widget.chat.lastSeen,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call, color: Colors.black),
            onPressed: () {
              // Handle video call action
            },
          ),
          IconButton(
            icon: Icon(Icons.call, color: Colors.black),
            onPressed: () {
              // Handle voice call action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more options action
            },
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
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
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
                  icon: Icon(Icons.send),
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
  final bool isUnread;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.profilePicture,
    required this.lastSeen,
    required this.isUnread,
  });
}
