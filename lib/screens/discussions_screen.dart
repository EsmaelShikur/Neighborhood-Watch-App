import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async'; // <-- For simulating typing and delays

class DiscussionsScreen extends StatefulWidget {
  @override
  _DiscussionsScreenState createState() => _DiscussionsScreenState();
}

class _DiscussionsScreenState extends State<DiscussionsScreen> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  bool isTyping = false;

  final List<String> fakeUsers = ['Abdu', 'Henok', 'Ali', 'Sara'];
  final List<String> fakeMessages = [
    'Hey everyone!',
    'Did you hear about the new park opening?',
    'Stay safe, there was a theft nearby.',
    'Who\'s joining the neighborhood meeting?',
    'Good morning!',
    'Any tips for securing bikes?',
  ];

  void _sendMessage({bool fromUser = true, String? username, String? text}) {
    setState(() {
      messages.add({
        'username': fromUser ? 'You' : username,
        'text': fromUser ? _controller.text.trim() : text,
        'time': DateFormat('hh:mm a').format(DateTime.now()),
        'isUser': fromUser,
      });
    });
    if (fromUser) _controller.clear();
    _scrollToBottom();
  }

  void _simulateFakeUserMessage() async {
    setState(() {
      isTyping = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulate typing...

    setState(() {
      isTyping = false;
    });

    _sendMessage(
      fromUser: false,
      username: (fakeUsers..shuffle()).first,
      text: (fakeMessages..shuffle()).first,
    );
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neighborhood Chat'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add your event creation logic here if needed
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment:
                      message['isUser']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          message['isUser']
                              ? Colors.blueAccent.withOpacity(0.2)
                              : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!message['isUser']) ...[
                          CircleAvatar(
                            radius: 14,
                            child: Text(
                              message['username'][0],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ), // First letter of username
                          ),
                          SizedBox(width: 8),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${message['username']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${message['text']}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${message['time']}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (isTyping)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  CircleAvatar(radius: 10, child: Icon(Icons.person, size: 14)),
                  SizedBox(width: 8),
                  Text(
                    'Someone is typing...',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Write a message...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onSubmitted: (_) {
                      _sendMessage();
                      _simulateFakeUserMessage();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: () {
                    _sendMessage();
                    _simulateFakeUserMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
