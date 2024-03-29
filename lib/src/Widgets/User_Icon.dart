import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {

  const UserIcon({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(top: 75.0),
      child: Column(
        children: [
          Icon(
            Icons.person_add_alt_1_sharp,
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(height: 10, width: double.infinity),
          Text(
            message,
            style: TextStyle(fontSize: 25, color: Colors.white),
          )
        ],
      ),
    );
  }
}
