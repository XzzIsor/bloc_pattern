import 'package:bloc_pattern/src/Widgets/Form/FormContainer.dart';
import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/Widgets/User_Icon.dart';
import 'package:bloc_pattern/src/Widgets/Background.dart';
import 'package:bloc_pattern/src/Widgets/CustomCircle.dart';


class SingUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          createCompleteBackGroundSing(),
          FormContainer(
            buttonMessage: 'Crear',
            bottomMessage: '¿Tienes una cuenta?',
            route: 'login',
          ),
          
        ],
      )
    );
  }
}

Widget createCompleteBackGroundSing(){
  return Stack(
        children: [
          Background(),
          Positioned(child: CustomCircle(), top: 200, left: 35,),
          Positioned(child: CustomCircle(), top: 55, right: 35,),
          Positioned(child: CustomCircle(), top: 80, left: -50),
          Positioned(child: CustomCircle(), top: 100, right: 85,),
          UserIcon(
            message: 'Crear Cuenta',
          ),
        ],
    );
}


