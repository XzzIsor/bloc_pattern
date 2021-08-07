import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.hintText,
      required this.onChange,
      required this.emailType,
      required this.obscureText,
      this.initialValue,
      required this.isLogin,
      this.isPrice,
      this.inputFormatters})
      : super(key: key);

  final String label;
  final IconData icon;
  final String hintText;
  final Function(String) onChange;
  final bool emailType;
  final bool obscureText;
  final String? initialValue;
  final bool isLogin;
  final bool? isPrice;
  final List<TextInputFormatter>? inputFormatters;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLogin
        ? TextFormField(
            initialValue: widget.initialValue,
            obscureText: widget.obscureText,
            onTap: _requestFocus,
            focusNode: _focusNode,
            onChanged: widget.onChange,
            keyboardType: widget.emailType
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(widget.icon, color: Colors.deepPurple),
              labelText: widget.label,
              labelStyle: TextStyle(
                  color:
                      _focusNode!.hasFocus ? Colors.deepPurple : Colors.grey),
              fillColor: Colors.deepPurple,
              hintText: widget.hintText,
              enabledBorder: _borderStyle(),
              focusedBorder: _borderStyle(),
            ),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(pattern);
              String? respEmail = regExp.hasMatch(value ?? '')
                  ? null
                  : 'No es un correo electrónico';
              String? respPass;

              if (value != null && value.length >= 6) {
                respPass = null;
              } else {
                respPass =
                    'La contraseña no cuenta con los carácteres necesarios';
              }

              return widget.emailType ? respEmail : respPass;
            },
          )
        : TextFormField(
          autocorrect: false,
            initialValue: widget.initialValue,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.obscureText,
            onTap: _requestFocus,
            focusNode: _focusNode,
            onChanged: widget.onChange,
            keyboardType: widget.emailType
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(widget.icon, color: Colors.deepPurple),
              labelText: widget.label,
              labelStyle: TextStyle(
                  color:
                      _focusNode!.hasFocus ? Colors.deepPurple : Colors.grey),
              fillColor: Colors.deepPurple,
              hintText: widget.hintText,
              enabledBorder: _borderStyle(),
              focusedBorder: _borderStyle(),
              focusedErrorBorder: _borderStyle()
            ),
             validator: (value) {
              String? resp = '';

              if (value == null || value.length < 1) {
                resp = 'El nombre es obligatorio';
              }
              return widget.isPrice! ? null : resp;
            },
          );
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  UnderlineInputBorder _borderStyle() {
    return UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 1.5));
  }
}
