
import 'package:bloc_pattern/src/Widgets/Form/FormContainer.dart';
import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/Widgets/User_Icon.dart';
import 'package:bloc_pattern/src/Widgets/Background.dart';
import 'package:bloc_pattern/src/Widgets/CustomCircle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          createCompleteBackGround(),
          FormContainer(),
        ],
      )
    );
  }
}

Widget createCompleteBackGround(){
  return Stack(
        children: [
          Background(),
          Positioned(child: CustomCircle(), top: 200, left: 35,),
          Positioned(child: CustomCircle(), top: 55, right: 35,),
          Positioned(child: CustomCircle(), top: 80, left: -50),
          Positioned(child: CustomCircle(), top: 100, right: 85,),
          UserIcon(),
        ],
    );
}


