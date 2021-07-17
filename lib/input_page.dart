
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result_page.dart';import 'calculator_brain.dart';
import 'ReusableCard.dart';
import 'package:bmi_calculator/Resuableicon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
int height=180;
int wieght=10;
int age=10;


void reset(){
  height=120;
  age=0;
  wieght=0;
}
enum Gender{
  male,
  female
}

const bottomContainerHeight=80.0;
const colourrr=Color(0xFF1D1F33);
const inactivCardColor= Color(0xFF111328);


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Color mc=inactivCardColor;
Color fc=inactivCardColor;





  void cch(Gender gendertype) {
    if (gendertype == Gender.male) {
      (mc == inactivCardColor) ? {mc = colourrr, fc = inactivCardColor,} : mc =
          inactivCardColor;
    }
      else if(gendertype==Gender.female){
        (fc==inactivCardColor)?{ fc=colourrr,mc=inactivCardColor}:        fc=inactivCardColor;
    }


    }



  @override
  Widget build(BuildContext context) {





    return Scaffold(

      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR'),
        ),
        leading: GestureDetector(
            onTap: (){
              setState(() {
reset();
              });
            },
            child: Icon(Icons.refresh)),

      ),
      body:
     Column(
       children: <Widget>[
        Expanded(
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ReusableCard(colorr: mc,
                cardChild: ReusableCol(
                icona: FontAwesomeIcons.mars,

                  texta: 'Male',

                ),
                  onPress: (){
                    setState(() {
                      cch(Gender.male);
                    });

                  },

              ),),
              Expanded(
                child: ReusableCard(colorr: fc,
                  onPress: (){
                    setState(() {
                      cch(Gender.female);
                    });

                  },
   cardChild: ReusableCol(
     icona: FontAwesomeIcons.venus
     ,
     texta: 'Female',
   ),
                    ),
              ),
            ],
          ),
        ),
         Expanded(
           child:Row(


             children: <Widget>[
               Expanded(
                 child: ReusableCard(colorr: colourrr,

                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text('HEIGHT',style: klabeltext,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline:TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                        style: kcardtext),
                          Text('CM'
                              ,
                              style: klabeltext)
                        ],
                      ),
                      Flexible(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.pink,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            activeTrackColor: Colors.white,
                          overlayColor: Colors.pink[200],
                          ),
                          child: Slider(

                          value:height.toDouble(),
                          min: 120.0,
                          max: 220.0,

                          inactiveColor: Colors.grey,
                            onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                              print(height);
                            });

                            },
                          ),
                        ),

                      )
                     ],
                   ),
                  ),
               ),


             ],
           ) ,
         ),
         Expanded(
           child:Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Expanded(
                 child: ReusableCard(colorr: colourrr,
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text('WEIGHT',style: klabeltext,),
                       Text(wieght.toString(),
                           style: kcardtext),
                       Flexible(

                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Button(

                               iconvalue: FontAwesomeIcons.minus,
                               f: (){
                                 setState(() {

                                   wieght--;
                                 });
                               },
                             ),

                             Button(iconvalue: FontAwesomeIcons.plus,
                               f: (){
                                 setState(() {
                                   wieght++;
                                 });
                               },),


                           ],
                         ),
                       ),

                     ],
                   ),
                  ),
               ),
               Expanded(

                 child: ReusableCard(colorr: colourrr,

                   cardChild:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text('AGE',style: klabeltext,),
                       Text(age.toString(),
                           style: kcardtext),
                       Flexible(

                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Button(

                               iconvalue: FontAwesomeIcons.minus,
                               f: (){
                                 setState(() {

                                   age--;
                                 });
                               },
                             ),

                             Button(iconvalue: FontAwesomeIcons.plus,
                               f: (){
                                 setState(() {
                                   age++;
    });
                               },),


                           ],
                         ),
                       ),

                     ],
                   ),
                 ),
               ),
             ],
           ) ,
         ),
    GestureDetector(
      onTap: (){

        Calculate_bmi calc=new Calculate_bmi(height: height,weight: wieght);




        Navigator.push(context, MaterialPageRoute(
          builder: (context)  =>  ResultPage(bmi1:calc.bmi_calculator(),bmi2: calc.result1(),bmi3: calc.result2(),)   ));
      },
      child: Container(

        child: Center(
          child: Text('CALCULATE BI',
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
      height:bottomContainerHeight,

        width: double.infinity,


      ),
    ),
       ],

     ),


    );
  }
}


class Button extends StatelessWidget {
  @override

  Function f;
  IconData iconvalue;
  Button({@required this.iconvalue, @required this.f});
  Widget build(BuildContext context) {
    return RawMaterialButton(
    child: Icon(iconvalue),
      onPressed: f,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0XFF4C4F5E),

    );
  }

}

