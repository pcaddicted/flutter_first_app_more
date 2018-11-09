import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home:new TestWidget()
    );
  }
}

class TestWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Scaffold(
       appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Flutter Demo'),
      ),
      body:new Center(
        child: Text(
          "put your text here",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),), 
      ),
    );
  }

}

class BarWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BarWidgetState();
    }   
}

class _BarWidgetState extends State<BarWidget>{
  var i = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Flutter Demo'),
      ),
      body:new Center(
        child: Row(
          children: <Widget>[
            Text('i=$i'),
            RaisedButton(onPressed: (){
              setState(() {
                ++i;
              });
            },
            child: Text('click'),
            ),
          ],
        ), 
      ),
    );
  }
}