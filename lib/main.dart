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
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo'),
      ),
      body:new Center(
        child: Image.network(
          "http://pic29.nipic.com/20130511/9252150_174018365301_2.jpg",
          width: 200.0,
          height: 150.0,
        ), 
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