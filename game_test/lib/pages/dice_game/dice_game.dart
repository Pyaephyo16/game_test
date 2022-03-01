import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_test/pages/dice_game/loser.dart';
import 'package:game_test/pages/dice_game/winner.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {

  final Random random = Random();

  

  String? error;
  int diceOne = 5;
  int diceTwo = 6;

  final TextEditingController _diceController = TextEditingController();

  final OutlineInputBorder border = OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            );


  Widget diceView(){
      return Container(
        margin: EdgeInsets.all(6),
                   width: 10,
                   height: 10,
               decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red[900],
           ),
         );
  }

  Widget getDice(int count){
    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(1,1),
                                blurRadius: 1,
                              ),
                            ]
                          ),
                        ),
                    
                       SizedBox(
                         height: 80,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                                           
                              if( (count) <= 3) ...[
                                           
                                Row(
                                  children: [
                                    for(int i=0;i < count;i++) diceView(),
                                  ],
                                )
                                           
                              ]else if(count == 5) ...[
                                           
                                  SizedBox(
                                 width: 80,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                                 diceView(),
                                 diceView(),
                             ],
                           ),
                               ),
                                           
                               Row(
                             children: [
                               diceView(),                            
                             ],
                           ),
                                           
                           SizedBox(
                             width: 80,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 diceView(),
                                 diceView(),
                               ],
                             ),
                           ),
                                           
                              ]else if(count == 4) ...[
                                           
                                SizedBox(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      for(int i=0;i < 2;i++) diceView(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      diceView(),
                                      diceView(),
                                    ],
                                  ),
                                ),
                                           
                              ]else ...[
                                           
                                 Row(
                                  children: [
                                    for(int i=0;i < 3;i++) diceView(),
                                  ],
                                ),
                                 Row(
                                  children: [
                                    for(int i=0;i < 3;i++) diceView(),
                                  ],
                                ),
                                           
                              ],
                                           
                           ],
                         ),
                       ),
                      ],
                    );
  }

  Future<void> startGame()async{
    
      if(_diceController.text.isEmpty){
        error = "Empty";
        setState(() {});
      }

      if(error != null ){
        setState(() {});
        return;
      }

      

     diceOne = 1+ random.nextInt(6);
     diceTwo = 1+ random.nextInt(6);
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
        if((diceOne+diceTwo).toString() == _diceController.text){
            Navigator.pushAndRemoveUntil(context,
             MaterialPageRoute(builder: (BuildContext context) => Winner()),
              (route) => false);
        }else{
            Navigator.pushAndRemoveUntil(context,
             MaterialPageRoute(builder: (BuildContext context) => Loser()),
              (route) => false);
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 18,right: 18,top: 166,bottom: 12),
        //color: Colors.grey,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.white,
              Colors.blue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceAround,        
          children: [ 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    getDice(diceOne),
                    getDice(diceTwo),                   
              ],
              ),

            if(error != null) Text("${error}",
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Colors.grey,
                  offset: Offset(1,1),
                  blurRadius: 8,
                )
              ]
            ),
            ),

              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row(
                  children: [
                      Expanded(
                        child: TextFormField(
                          controller: _diceController,
                          keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter number",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.4),
                              contentPadding: EdgeInsets.only(left: 16),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: border,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorStyle: TextStyle(
                                height: 0,
                              ),
                            ),
                           // validator: (a) => int.tryParse(a ?? "") == null ? "Invalid Number" : null,
                           validator: (a){
                             error = int.tryParse(a ?? "")==null ? "Inavalid Number" : int.parse(a!) > 12 ? "Out Of Range" : null;

                    
                             return null;
                           },
                           onFieldSubmitted: (a){
                             setState(() {
                             });
                           },
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 100,
                        height: 47,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4),),
                            elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: (){
                              startGame();
                          },
                         child: Text("Start",
                         style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w600,
                    
                           ),),
                         ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}