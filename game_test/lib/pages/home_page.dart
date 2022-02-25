import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_test/vos/image_vo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int? number1;
  int? number2;
  int? number3;
  ImageVO? image;
  int? userSelect;
   int score = 0;
  List<ImageVO> imageList= [
      ImageVO(image: "./images/one_for_game.png", value: 1),
      ImageVO(image: "./images/two_for_game.png", value: 2),
      ImageVO(image: "./images/three_for_game.png", value: 3),
      ImageVO(image: "./images/four_for_game.png", value: 4),
      ImageVO(image: "./images/five_for_game.png", value: 5),
      ImageVO(image: "./images/six_for_game.png", value: 6),
      ImageVO(image: "./images/seven_for_game.png", value: 7),
      ImageVO(image: "./images/eight_for_game.png", value: 8),
      ImageVO(image: "./images/nine_for_game.png", value: 9),
  ];

  @override
  void initState() {
        generateRandomNumber();
    super.initState();
  }

  void generateRandomNumber(){
    var ran1 = new Random();
    var ran2 = new Random();
    var ran3 = new Random();

    setState(() {
      number1 = 1+ ran1.nextInt(9);

     
        number2 = 1+ ran2.nextInt(9);
      if(number1==number2){
        ran2 = new Random();
        number2 = 1+ ran2.nextInt(9);
      }


        number3 = 1+ ran3.nextInt(9);
        if(number3 == number1 || number3 == number2){
          ran3 = new Random();
          number3 = 1+ ran3.nextInt(9);
        }

     });
  
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 62,),
                  Text("Please select ${number1 ?? 0}",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 44,),
                  Center(
                    child: Container(
                      width: 100,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                            ImageView(
                              imageList: imageList, 
                              number: number1,
                              userSelection: (userText){
                                setState(() {
                                  userSelect = userText;
                                  if(userSelect==number1){
                                    score = score+10;
                                  }
                                });
                              },
                              ),
                            SizedBox(height: 12,),
                            ImageView(
                              imageList: imageList,
                               number: number2,
                                userSelection: (userText){
                                setState(() {
                                  userSelect = userText;
                                   if(userSelect==number1){
                                    score = score+10;
                                  }
                                });
                              },
                               ),
                             SizedBox(height: 12,),
                            ImageView(
                              imageList: imageList,
                               number: number3,
                                userSelection: (userText){
                                setState(() {
                                  userSelect = userText;
                                   if(userSelect==number1){
                                    score = score+10;
                                  }
                                });
                              },
                               ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 42),
                   if(userSelect != null)  if(number1 == userSelect) ResultView(result: "Your answer is correct",),
                    if(userSelect != null)  if(number1 != userSelect) ResultView(result: "Your answer is wrong",),
                     SizedBox(height: 32),
                     Center(
                       child: OutlineButton(
                         borderSide: BorderSide(color: Colors.amber),
                         onPressed: (){
                           generateRandomNumber();
                           userSelect= null;
                         },
                         child: Text("Next",style: TextStyle(
                           color: Colors.amber,
                           fontSize: 22,
                         ),),
                         ),
                     ),
                     SizedBox(height: 12,),  
                    
                     ScoreView(score: score),
        ],),
      ),
    );
  }
}

class ScoreView extends StatelessWidget {

  final int score;

  ScoreView({required this.score});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("Score : ${score}",
         style: TextStyle(
          color: Colors.amber,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        ),
    );
  }
}

class ResultView extends StatelessWidget {
 
  String? result;

  ResultView({required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("${result}",
        style: TextStyle(
          color: Colors.amber,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.imageList,
    required this.number,
    required this.userSelection,
  }) : super(key: key);

  final List<ImageVO> imageList;
  final int? number;
  final Function(int) userSelection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          userSelection(imageList[(number!)-1].value);
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 2,color: Colors.amber),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset("${imageList[(number!)-1].image}",fit: BoxFit.contain,),
      ),
    );
  }
}
