import 'package:flutter/material.dart';
import 'dart:math';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  //we we have to use on animation we use with singleTickerProviderStatemixin and if we have to add more than one animations we use TickerProviderStateMixin
  int leftDiceNumber = 1;
  int RightDiceNumber = 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {  //when app start do this
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  animate() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds:
                400)); //we pass the same value in vsync which we draw by with ticker.....
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    animation.addListener(() {
      setState(() {
        //jitni baar value change hogi utn baar set stae call hoga or ui change krega
      });
      print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //jab animation adha complete hojayega tab value change hogi or reverse animation me nya value ajayega
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          RightDiceNumber = Random().nextInt(6) + 1;
        });
        print('completed');
        _controller.reverse(); //when animaton got completed to reverse it
      }
    });
  }

  void roll() {
    _controller.forward(); //when button is pressed the aniamtion start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice roll')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Expanded(
                child: GestureDetector(
                  onDoubleTap: () {
                    roll();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      height: 200 - (animation.value) * 200,
                      image: AssetImage(
                          'assets/images/dice-png-$leftDiceNumber.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: () {
                    roll();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      height: 200 - (animation.value) * 200,
                      image: AssetImage(
                          'assets/images/dice-png-$RightDiceNumber.png'),
                    ),
                  ),
                ),
              ),
            ]),
            RaisedButton(
              onPressed: roll,
              child: Text(
                'Roll',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
