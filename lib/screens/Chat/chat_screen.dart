import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Color purple = const Color(0xFF6c5ce7);
  Color black = const Color(0xFF191919);
  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;

  @override
  void initState() {
    socket = IO.io(
      'http://localhost:4000', 
      IO.OptionBuilder()
        .setTransports(['webSocket'])
        .disableAutoConnect()
        .build()
    );
    socket.connect();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return const MessageItem(sentByMe: false,);
                  }),
              )),
            Expanded(child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: TextField(
                style: const TextStyle(
                  color: Colors.white
                ),
                cursorColor: purple,
                controller: msgInputController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  suffixIcon: Container(
                    margin:const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: (){
                        sendMessage(msgInputController.text);
                        msgInputController.text = "";
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      ),
                  )
                ),
              ),
            ))
        ]),
      ),
    );
  }

  void sendMessage(String text){
    var messageJson = {
      "message":text,
      "sentByMe" : socket.id
    };
    socket.emit('message',messageJson);
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.sentByMe});

  final bool sentByMe;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe?Alignment.centerRight : Alignment.centerLeft ,
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10) ,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sentByMe? Colors.blue: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text("hello", style: TextStyle( color: sentByMe? Colors.white: Colors.black)),
            Text(
              "11:10 AM", 
              style: TextStyle( 
                color: (sentByMe? Colors.white: Colors.black).withOpacity(0.5),
                fontSize: 10
              )
            ),

          ],
        ),
      ),
    );
  }
}