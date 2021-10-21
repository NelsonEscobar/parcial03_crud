import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AgregarClientePage extends StatefulWidget {
  AgregarClientePage({Key? key}) : super(key: key);

  @override
  _AgregarClientePageState createState() => _AgregarClientePageState();
}

class _AgregarClientePageState extends State<AgregarClientePage> {
  final _formKey = GlobalKey<FormState>();
  
  var cedula = "";
  var nombre = "";
  var apellido = "";
  var fechanac = "";
  var sexo = "";
  var tipo = "";
  var usuario = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final cedulaController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final fechanacController = TextEditingController();
  final sexoController = TextEditingController();
  final tipoController = TextEditingController();
  final usuarioController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cedulaController.dispose();
    nombreController.dispose();
    apellidoController.dispose();
    fechanacController.dispose();
    sexoController.dispose();
    tipoController.dispose();
    usuarioController.dispose();
    super.dispose();
  }

  clearText() {
    cedulaController.clear();
    nombreController.clear();
    apellidoController.clear();
    fechanacController.clear();
    sexoController.clear();
    tipoController.clear();
    usuarioController.clear();
  }

  // Adding Student
  CollectionReference clientes =
      FirebaseFirestore.instance.collection('clientes');

  Future<void> addUser() {
    return clientes
        .add({'cedula': cedula,'nombre': nombre, 'apellido': apellido,'fechanac':fechanac,'sexo':sexo,'tipo':tipo,'usuario':usuario})
        .then((value) => print('Cliente nuevo agregado'))
        .catchError((error) => print('Fallo al agregar cliente: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Agregar Nuevo Cliente"),
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
                    labelText: 'Cedula: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: cedulaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar numero de cedula porfavor';
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
                    labelText: 'Nombre: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: nombreController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar un nombre porfavor';
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
                    labelText: 'Apellido: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: apellidoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar un apellido porfavor';
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
                    labelText: 'Fecha de nacimiento: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: fechanacController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar su fecha de nacimiento porfavor';
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
                    labelText: 'Sexo: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: sexoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar su sexo porfavor';
                    }
                    return null;
                  },
                ),
              ),
              //campo tipo
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Tipo de cliente: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: tipoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar su tipo de cliente porfavor';
                    }
                    return null;
                  },
                ),
              ),
             //campo usuario
             Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Usuario: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: usuarioController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingresar un nombre de usuario porfavor';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            nombre = nombreController.text;
                            cedula=cedulaController.text;
                            apellido=apellidoController.text;
                            fechanac=fechanacController.text;
                            sexo=sexoController.text;
                            tipo=tipoController.text;
                            usuario=usuarioController.text;
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
