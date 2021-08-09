import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc_pattern/Providers/LoginProvider.dart';
import 'package:bloc_pattern/src/Widgets/Form/CustomForm.dart';

class FormContainer extends StatelessWidget {
  final String bottomMessage;
  final String buttonMessage;
  final String route;

  const FormContainer(
      {Key? key, required this.bottomMessage, required this.route, required this.buttonMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(5, 5))
                ]),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            child: ChangeNotifierProvider(
                create: (_) => LoginProvider(), child: CustomForm(
                  buttonMessage: buttonMessage,
                )),
          ),
          SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, route);
            },
            child: Text(bottomMessage,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    Colors.deepPurple.withOpacity(0.2)),
                shape: MaterialStateProperty.all(StadiumBorder())),
          )
        ],
      ),
    );
  }
}
