import 'package:flutter/material.dart';
import 'package:game_test/pages/dice_game/dice_game.dart';

class Winner extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Text("Congratulation! You are a Winner",),
              OutlineButton(onPressed: (){
                Navigator.push(context,
                 MaterialPageRoute(builder: (BuildContext context)=> DiceGame()));
              },
              child: Text("Next Round"),
              ),
          ],
        ),
      ),
    );
  }
}