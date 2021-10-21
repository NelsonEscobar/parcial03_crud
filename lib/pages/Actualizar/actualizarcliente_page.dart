import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ActualizarClientePage extends StatefulWidget {
  final String id;
  ActualizarClientePage({Key? key, required this.id}) : super(key: key);

  @override
  _ActualizarClientePageState createState() => _ActualizarClientePageState();
}

class _ActualizarClientePageState extends State<ActualizarClientePage> {
  final _formKey = GlobalKey<FormState>();

  // Updaing Student
  CollectionReference clientes =
      FirebaseFirestore.instance.collection('clientes');

  Future<void> updateUser(id, cedula, nombre, apellido,fechanac,sexo,tipo,usuario) {
    return clientes
        .doc(id)
        .update({'cedula': cedula,'nombre': nombre, 'apellido': apellido,'fechanac':fechanac,'sexo':sexo,'tipo':tipo,'usuario':usuario})
        .then((value) => print("Cliente actualizado"))
        .catchError((error) => print("Fallo al actualizar cliente: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Actualizar Cliente"),
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('clientes')
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print('Ocurrio un fallo');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data!.data();
              var cedula = data!['cedula'];
              var nombre = data['nombre'];
              var apellido = data['apellido'];
              var fechanac = data['fechanac'];
              var sexo = data['sexo'];
              var tipo = data['tipo'];
              var usuario = data['usuario'];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: cedula,
                        autofocus: false,
                        onChanged: (value) => cedula = value,
                        decoration: InputDecoration(
                          labelText: 'Cedula: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor ingresar cedula';
                          }
                          return null;
                        },
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: nombre,
                        autofocus: false,
                        onChanged: (value) => nombre = value,
                        decoration: InputDecoration(
                          labelText: 'Nombre: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor su nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: apellido,
                        autofocus: false,
                        onChanged: (value) => apellido = value,
                        decoration: InputDecoration(
                          labelText: 'Apellido: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor su nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: fechanac,
                        autofocus: false,
                        onChanged: (value) => fechanac = value,
                        decoration: InputDecoration(
                          labelText: 'Fecha de nacimiento: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor su fecha de nacimiento';
                          }
                          return null;
                        },
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: sexo,
                        autofocus: false,
                        onChanged: (value) => sexo = value,
                        decoration: InputDecoration(
                          labelText: 'Sexo: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor ingresar cedula';
                          }
                          return null;
                        },
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: tipo,
                        autofocus: false,
                        onChanged: (value) => tipo = value,
                        decoration: InputDecoration(
                          labelText: 'Tipo de cliente: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor ingrese su tipo de cliente';
                          }
                          return null;
                        },
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: usuario,
                        autofocus: false,
                        onChanged: (value) => usuario = value,
                        decoration: InputDecoration(
                          labelText: 'Usuario: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Porfavor su nombre de usuario';
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
                                updateUser(widget.id, cedula, nombre,apellido,fechanac,sexo,tipo,usuario);
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Actualizar',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: Text(
                              'Reiniciar',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal.shade900),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
