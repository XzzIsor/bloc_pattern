import 'dart:async';

class Validator {

  StreamTransformer validatePassword = StreamTransformer<String, String>.fromHandlers(
    
    handleData: (password, sink){
      if(password.length < 6){
        sink.addError("la contraseña debe tener mas de 6 caracteres"); 
      }else{
        sink.add(password);
      }
    }
  );

  StreamTransformer validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);

      if(regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Ingrese un correo valido');
      }

    }
  );
}