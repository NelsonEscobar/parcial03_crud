import 'package:flutter/material.dart';
import 'package:parcial03_crud/pages/Agregar/agregarreserva_page.dart';

import 'package:parcial03_crud/pages/Listas/listareservas_page.dart';


class ReservasPage extends StatefulWidget {
  ReservasPage({Key? key}) : super(key: key);

  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Parcial 03 CRUD Aeropuerto'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgregarReservaPage(),
                  ),
                )
              },
              child: Text('Agregar', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.teal),
            )
          ],
        ),
      ),
      body: ListaReservaPage(),
    );
  }
}
