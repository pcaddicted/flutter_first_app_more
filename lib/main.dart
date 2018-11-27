import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"navigator",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: FirstApp(),
    );
  }
}

class FirstApp extends StatefulWidget{
  @override
  State createState() {
    // TODO: implement createState
    return _FirstAppState();
  }
   
}
 
class _FirstAppState extends State<FirstApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAVIGATOR"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("first app"),
          onPressed: () async {
            var msg = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SecondApp())
            );
            debugPrint('msg = $msg');
          }
        ),
      ),
    );
  }
}

class SecondApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondAppState();
  }
}

class SecondAppState extends State<SecondApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("secondapp"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("back"),
          onPressed: (){
            Navigator.pop(context,"message from second screen");
          },
        ),
      ),
    );
  }

}