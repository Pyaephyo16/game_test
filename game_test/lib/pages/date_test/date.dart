import 'package:flutter/material.dart';
import 'package:game_test/vos/date_vo.dart';
import 'package:intl/intl.dart';

class DateTest extends StatefulWidget {
  @override
  _DateTestState createState() => _DateTestState();
}

class _DateTestState extends State<DateTest> {

String? bookingDate;
List<DateVO> dateList = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
                      .map((date){
                        return DateTime.now().add(Duration(days: date));
                      }).map((dateTime){
                          return DateVO(
                            date: DateFormat("yyyy-MM-dd").format(dateTime),
                            weekDay: dateTime.weekday,
                            isSelected: false
                          );
                      }).toList();


    @override
  void initState() {

  

    super.initState();
  }

  String? generateWeekDay(int number){

     String? dateNum;

      switch(number){
        case 1: dateNum = "Monday";break;
        case 2: dateNum = "Tueday";break;
        case 3: dateNum = "Wednesday";break;
        case 4: dateNum = "Thursday";break;
        case 5: dateNum = "Friday";break;
        case 6: dateNum = "Saturday";break;
        case 7: dateNum = "Sunday";break;
      }

      return dateNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 46),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (BuildContext context,int index) => SizedBox(width: 20,),
                                itemCount: dateList.length,
                                itemBuilder: (BuildContext context,int index){
                                          return CalendarView(
                            dateList: dateList,
                            dateNumber: generateWeekDay(dateList[index].weekDay ?? 0) ?? "",
                            index: index,
                            isSelected: dateList[index].isSelected ?? false,
                            userChooseDate: (date){
                              setState(() {
                                bookingDate = date;
                                dateList.forEach((element) {
                                  element.isSelected = false;
                                });
                                dateList[index].isSelected = true;
                              });
                          }
                            );
                              }),
                      ), 
                      SizedBox(height: 40,),
                       Text("${bookingDate ?? DateTime.now().toString().split(" ")[0]}"),
                    Wrap(
                      children: [
                        Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(height: 12,width: 12,),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(height: 12,width: 12,),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(height: 12,width: 12,),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(height: 12,width: 12,),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(height: 12,width: 12,),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                    SizedBox(height: 12,width: 12,),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    ),
                 

                      ],
                    )
                    
                      
                    ],
                  )     
          ),
    );
  }
}


class CalendarView extends StatelessWidget {
  
 final List<DateVO> dateList;
 final String dateNumber;
 final int index;
 final bool isSelected;
 final Function(String) userChooseDate;

  CalendarView({required this.dateList,required this.dateNumber,required this.index,required this.isSelected,required this.userChooseDate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          userChooseDate(dateList[index].date ?? "");
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${dateNumber}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isSelected==true ? Colors.amber : Colors.black,
                        ),),  
            
             SizedBox(height: 8,),
            Text("${dateList[index].date!.substring(8)}",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: isSelected==true ? Colors.amber : Colors.black,
      ),
      ),
        ],
      ),
      );
  }
}