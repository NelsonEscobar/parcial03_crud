import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AgregarVueloPage extends StatefulWidget {
  AgregarVueloPage({Key? key}) : super(key: key);

  @override
  _AgregarVueloPageState createState() => _AgregarVueloPageState();
}

class _AgregarVueloPageState extends State<AgregarVueloPage> {
  final _formKey = GlobalKey<FormState>();
  
  var tipovuelo = "";
  var nombredestino = "";
  var hora= "";
  var disponibilidad= "";
  var avion= "";
  
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final tipovuelaController = TextEditingController();
  final nombredestinoController = TextEditingController();
  final horaController = TextEditingController();
  final disponibilidadController = TextEditingController();
  final avionController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    tipovuelaController.dispose();
    nombredestinoController.dispose();
    horaController.dispose();
    disponibilidadController.dispose();
    avionController.dispose();
    super.dispose();
  }

  clearText() {
    tipovuelaController.clear();
    nombredestinoController.clear();
    horaController.clear();
    disponibilidadController.clear();
    avionController.clear();
    
  }

  // Adding Student
  CollectionReference vuelos =
      FirebaseFirestore.instance.collection('vuelos');

  Future<void> addUser() {
    return vuelos
        .add({'tipovuelo': tipovuelo,'nombredestino': nombredestino, 'hora': hora,'disponibilidad': disponibilidad, 'avion':avion})
        .then((value) => print('Vuelo nuevo agregado'))
        .catchError((error) => print('Fallo al agregar Vuelo: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Agregar Nuevo vuelo"),
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
                    labelText: 'Tipo de vuelo: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: tipovuelaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar Tipo de vuelo porfavor';
                    }
                    return null;
                  },
                ),
              ),
              //campo nombre
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Destino: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nombredestinoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar su destino porfavor';
                    }
                    return null;
                  },
                ),
              ),
              //campo apellido
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Disponibilidad: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: disponibilidadController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar la disponivilidad de vuelo porfavor';
                    }
                    return null;
                  },
                ),
              ),
              //fecha de nacimiento
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Hora: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: horaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar su hora porfavor';
                    }
                    return null;
                  },
                ),
              ),
              //campo sexo
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'avion: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: avionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar el modelo de avion del vuelo';
                    }
                    return null;
                  },
                ),
              ),
              //campo tipo
             
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            tipovuelo = tipovuelaController.text;
                            nombredestino=nombredestinoController.text;
                            hora=horaController.text;
                            disponibilidad=disponibilidadController.text;
                            avion=avionController.text;
                        
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
