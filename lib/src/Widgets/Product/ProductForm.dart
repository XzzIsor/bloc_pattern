
import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity, 
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.production_quantity_limits_sharp, color: Colors.deepPurple),
                  labelText: 'Nombre del producto',
                ),
              ),

              SizedBox(height: 30),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.money, color: Colors.deepPurple),
                  labelText: 'Precio',
                ),
              ),
              SizedBox(height: 30),

              SwitchListTile(
                title: Text('Disponible'),
                activeColor: Colors.deepPurple,
                value: true, 
                onChanged: (value){
                  //TODO: Pendiente
                }
              ),
              SizedBox(height: 20),


            ],
          ),
        ),
        decoration: _decoration());
  }

  BoxDecoration _decoration() => BoxDecoration(

    color: Colors.grey,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 2.0,
        offset: Offset(5,5)
      )
    ]

  );
}
