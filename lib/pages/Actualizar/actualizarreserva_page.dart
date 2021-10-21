import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ActualizarReservaPage extends StatefulWidget {
  final String id;
  ActualizarReservaPage({Key? key, required this.id}) : super(key: key);

  @override
  _ActualizarReservaPageState createState() => _ActualizarReservaPageState();
}

class _ActualizarReservaPageState extends State<ActualizarReservaPage> {
  final _formKey = GlobalKey<FormState>();

  // Updaing Student
  CollectionReference reservas =
      FirebaseFirestore.instance.collection('reservas');

  Future<void> updateUser(id,estado) {
    return reservas
        .doc(id)
        .update({'estado': estado })
        .then((value) => print("Reserva actualizado"))
        .catchError((error) => print("Fallo al actualizar estado de la reserva: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Actualizar Reserva"),
      ),
      body: Form(
          key: _formKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('reservas')
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
              var estado = data!['estado'];
              
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: estado,
                        autofocus: false,
                        onChanged: (value) => estado = value,
                        decoration: InputDecoration(
                          labelText: 'Estado: ',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState!.validate()) {
                                updateUser(widget.id, estado);
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
