import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AgregarReservaPage extends StatefulWidget {
  AgregarReservaPage({Key? key}) : super(key: key);

  @override
  _AgregarReservaPageState createState() => _AgregarReservaPageState();
}

class _AgregarReservaPageState extends State<AgregarReservaPage> {
  final _formKey = GlobalKey<FormState>();
  
  var estado = "";
  
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final estadoController = TextEditingController();



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    estadoController.dispose();
    super.dispose();
  }

  clearText() {
    estadoController.clear();
    
  }

  // Adding Student
  CollectionReference reservas =
      FirebaseFirestore.instance.collection('reservas');

  Future<void> addUser() {
    return reservas
        .add({'estado': estado})
        .then((value) => print('Estado nuevo agregado'))
        .catchError((error) => print('Fallo al agregar estado: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Agregar Nueva Reserva"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              //campo cedula
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Estado: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: estadoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar su estado porfavor';
                    }
                    return null;
                  },
                ),
              ),
              //campo nombre
              
             //campo usuario
             
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            estado = estadoController.text;
                            
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Registrar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reiniciar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.teal.shade100),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
