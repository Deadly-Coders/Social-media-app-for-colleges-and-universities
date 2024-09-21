import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

class ChattingPage extends StatefulWidget {
  final String friendId;
  final String userId;
  final String friendName;

  const ChattingPage({
    super.key,
    required this.friendId,
    required this.userId,
    required this.friendName,
  });

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  List<dynamic> messages = [];
  bool isLoading = true;
  late IO.Socket socket;
  TextEditingController messageController = TextEditingController();
  String? jwtToken; // Declare a variable to store the JWT token

  @override
  void initState() {
    super.initState();
    _connectSocketIO();
    _fetchConversation();
  }

  // Connect to Socket.IO server
  void _connectSocketIO() {
    socket = IO.io('http://192.168.209.112:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    // Listen for new messages
    socket.on('newMessage', (message) {
      setState(() {
        messages.add(message);
      });
    });

    print('Connected to Socket.IO');
  }

  Future<void> _fetchConversation() async {
    try {
      // Retrieve the JWT token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      jwtToken = prefs.getString('jwt_token');

      print(
          'Fetching conversation for userId: ${widget.userId} and friendId: ${widget.friendId}');
      final response = await http.get(
        Uri.parse(
            'http://192.168.209.112:3000/api/v1/messages/conversation?userId=${widget.userId}&friendId=${widget.friendId}'),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          messages = data['messages'] != null
              ? List<dynamic>.from(data['messages'])
              : []; // Provide a fallback
          isLoading = false;
        });
      } else {
        print(
            'Failed to load conversation: ${response.statusCode} - ${response.body}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching conversation: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _sendMessage(String messageText) {
    if (messageText.isNotEmpty) {
      socket.emit('sendMessage', {
        'senderId': widget.userId,
        'receiverId': widget.friendId,
        'message': messageText,
      });

      setState(() {
        messages.add({
          'senderId': widget.userId,
          'receiverId': widget.friendId,
          'message': messageText,
        });
      });

      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isSender = message['senderId'] == widget.userId;
                      return ChatMessage(
                        text: message['message'],
                        isSender: isSender,
                        senderName: isSender ? 'You' : widget.friendName,
                      );
                    },
                  ),
                ),
                _buildMessageInput(),
              ],
            ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type a message',
              ),
              onSubmitted: _sendMessage, // Send message when submitted
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _sendMessage(messageController.text),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    socket.dispose();
    messageController.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSender;
  final String senderName;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isSender,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(senderName),
          Material(
            color: isSender ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isSender ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
