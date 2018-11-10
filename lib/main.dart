import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSection('Oeschinen Lake Camground','Kandersteg,Switzerland', 41);
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar:AppBar (
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width:600.0,
              height:240.0,
              fit:BoxFit.cover,
            ),
            titleSection,
          ],
        )
      ),
    );
  }
}

class _TitleSection extends StatelessWidget{
  final String title;
  final String subtitle;
  final int stratCount;

  _TitleSection(this.title,this.subtitle,this.stratCount);

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style:TextStyle(fontWeight:FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(stratCount.toString())
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(BuildContext context,IconData icon,String label){
  final color = Theme.of(context).primaryColor;

  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon,color:color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style:TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}
