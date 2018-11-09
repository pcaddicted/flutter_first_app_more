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
      home:new MessageForm()
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
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo'),
      ),
      body: new Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: editController,
              ),
            ),
            RaisedButton(
              child: Text('click'),
              onPressed:(){
                showDialog(
                  context: context,
                  builder: (_){
                    return AlertDialog(
                        content:Text(editController.text), 
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: ()=>Navigator.pop(context),
                          )
                        ],
                      );
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      editController.dispose();
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
        child: RaisedButton(
          onPressed: ()=>print('FlatButton pressed'),
          child: Text('Button'),
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