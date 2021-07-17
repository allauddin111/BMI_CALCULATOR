
import 'input_page.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

InputPage ip=new InputPage();
class ResultPage extends StatelessWidget {
  @override

  ResultPage({@required this.bmi1,@required this.bmi2,@required this.bmi3});

  final String bmi1;
  final String bmi2;
  final String bmi3;


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
          title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:10.0),
              child: Text(
                '  Your Results are',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w900
                )

              ),
            ),

        Expanded(



            child: Container(
padding: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),


                color: kcolourrr


              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                Text(bmi2,style: TextStyle(
                  color: Colors.green,
                  fontSize: 17.0
                ),),
                  Text(bmi1,style: kcardtext,),
                  Text(bmi3,style:
                  TextStyle(

                    letterSpacing: 1.0
                  ))
                ],
              ),




          ),
        ),

          GestureDetector(
            onTap: (){
                  reset();
              Navigator.pop(context);
            },
            child: Container(

              child: Center(
                child: Text('RE-CALCULATE',
                  style: TextStyle(

                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900
                  ),),
              ),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height:kbottomContainerHeight,

              width: double.infinity,


            ),
          )

        ],
      ),
    );
  }
}
