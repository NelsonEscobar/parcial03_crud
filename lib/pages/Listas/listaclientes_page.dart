import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial03_crud/pages/Actualizar/actualizarcliente_page.dart';


class ListaClientePage extends StatefulWidget {
  ListaClientePage({Key? key}) : super(key: key);

  @override
  _ListaClientePageState createState() => _ListaClientePageState();
}

class _ListaClientePageState extends State<ListaClientePage> {
  final Stream<QuerySnapshot> clientesStream =
      FirebaseFirestore.instance.collection('clientes').snapshots();

  // For Deleting User
  CollectionReference clientes =
      FirebaseFirestore.instance.collection('clientes');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return clientes
        .doc(id)
        .delete()
        .then((value) => print('Eliminar cliente'))
        .catchError((error) => print('Fallo al eliminar cliente: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: clientesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Sucedio un problema');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          color: Colors.teal.shade50,
                          child: Center(
                            child: Text(
                              'Cedula',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.teal.shade50,
                          child: Center(
                            child: Text(
                              'Nombre',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                         TableCell(
                        child: Container(
                          color: Colors.teal.shade50,
                          child: Center(
                            child: Text(
                              'Apellido',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          color: Colors.teal.shade50,
                          child: Center(
                            child: Text(
                              'Acción',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['cedula'],
                                  style: TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['nombre'],
                                  style: TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['apellido'],
                                  style: TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ActualizarClientePage
                                      (id: storedocs[i]['id']),
                                      
                                    ),
                                  )
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    {deleteUser(storedocs[i]['id'])},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}
