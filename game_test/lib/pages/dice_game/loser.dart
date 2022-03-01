import 'package:flutter/material.dart';
import 'package:game_test/pages/dice_game/dice_game.dart';

class Loser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                 Text("Sorry! You are a Loser"),
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