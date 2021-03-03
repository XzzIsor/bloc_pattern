import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final String image;
  const CustomButton({this.text, this.onTap, this.image});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      
      icon:  image != null ? Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(image), fit: BoxFit.contain))) : Container(),
      label:  Container(
            padding: EdgeInsets.symmetric(horizontal: image==null?  80 : 0, vertical: 15),
            child: Text(text),
      ),
        
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: onTap,
    );
  }
}
