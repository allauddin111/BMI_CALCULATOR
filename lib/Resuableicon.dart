import 'package:flutter/material.dart';
import 'constants.dart';


  class ReusableCol extends StatelessWidget {
  ReusableCol({this.icona,this.texta});
  final IconData icona;
  final String texta;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icona,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(texta,
          style: klabeltext,
          // style: TextStyle(
          //     fontSize: 18.0,
          //     fontStyle: FontStyle.italic
          // ),
        )
      ],
    );
  }
}

