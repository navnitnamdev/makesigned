import 'package:flutter/material.dart';

import 'ChatMessage.dart';


class ScreenLayoutBuilder extends StatefulWidget {
  const ScreenLayoutBuilder({super.key});

  @override
  State<ScreenLayoutBuilder> createState() => _LayoutbuilderState();
}

class _LayoutbuilderState extends State<ScreenLayoutBuilder> {
  //final List<String> messages = [];
  String msgtypeside="";
  final TextEditingController _controller = TextEditingController();
  List<ChatMessage> messages = [

  ];


  void _sendMessage(String messageType) {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(messageContent: _controller.text, messageType: messageType));
        _controller.clear();


      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Expanded(
             child:ListView.builder(
               itemCount: messages.length,
               shrinkWrap: true,
               padding: EdgeInsets.only(top: 10,bottom: 10),
             //  physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context, index){

                 msgtypeside = messages[index].messageType;
                 print("msgtypeside"+msgtypeside);
                 return Container(
                   padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                   child: Align(
                     alignment: (messages[index].messageType == "receiver"? Alignment.topLeft:Alignment.topRight),
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                       ),
                       padding: EdgeInsets.all(16),
                       child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
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
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),



                SizedBox(width: 8),
                msgtypeside== "sender" ?   ElevatedButton(
                  onPressed: () => _sendMessage("receiver"),
                  child: Text('Send as Receiver') ): ElevatedButton(
    onPressed: () => _sendMessage("sender"),

    child: Text('Send as Sender'),
    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}