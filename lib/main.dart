import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class Message{
  final String msg;
  final int timestamp;

  Message(this.msg, this.timestamp);

  @override
  String toString() {
    // TODO: implement toString
    return 'Message {msg:$msg,timestamp:$timestamp}';
  }
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UX demo',
      home: MessageListScreen(),
    );
  }

}

class AddMessageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: MessageForm(),
    );
  }

}

class MessageForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm>{
  final editController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black54
                ),
                controller: editController,
                //自动获取焦点。这样在页面打开时就会自动弹出输入法
                autofocus: true,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              debugPrint('send ${editController.text}');
              final msg = Message(
                editController.text,
                DateTime.now().millisecondsSinceEpoch
              );
              Navigator.pop(context,msg);
            },
            onDoubleTap:() => debugPrint('double tapped'),
            onLongPress: () => debugPrint('long pressed'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Text('send'),
            ),
          )
        ],
      ),
    );
  }
}

//消息展示页面
class MessageListScreen extends StatelessWidget{
  final messageListKey = GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Echo client'),
      ),
      body: MessageList(key: messageListKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddMessageScreen())
          );
          debugPrint('result = $result');
          if (result is Message) {
            messageListKey.currentState.addMessage(result);
          }
        },
        tooltip: 'AddMessage',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MessageList extends StatefulWidget{
  MessageList({Key key}):super(key:key);
  
  @override
  State<StatefulWidget> createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList>{
  final List<Message> messages = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context,index){
        final msg = messages[index];
        final subtitle = DateTime.
                        fromMicrosecondsSinceEpoch(msg.timestamp)
                        .toLocal()
                        .toIso8601String();
        return ListTile(
          title: Text(msg.msg),
          subtitle: Text(subtitle),
        );
      }
    );
  }
  void addMessage(Message msg){
    setState(() {
          messages.add(msg);
        });
  }
}