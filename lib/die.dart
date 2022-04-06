import 'package:flutter/material.dart';
import 'package:rollingdice/homescreen.dart';
import 'package:rollingdice/homescreen1.dart';

class Die extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose an option'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 155, bottom: 155),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen1()));
                },
                child: Text(
                  'One Dice',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                splashColor: Colors.red,
              )),
              Center(
                  child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
                },
                child: Text(
                  'Two Die',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                splashColor: Colors.red,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
