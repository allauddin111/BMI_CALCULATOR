import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colorr, this.cardChild,this.onPress});
  final Color colorr;
  final Widget cardChild;
  final Function onPress;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onPress,
      child: Container(

        margin: EdgeInsets.all(10.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: colorr,
          borderRadius: BorderRadius.circular(20.0),

        ),
        height: 200,
        width: 170,

      ),
    );
  }
}

