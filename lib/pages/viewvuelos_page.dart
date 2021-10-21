import 'package:flutter/material.dart';
import 'package:parcial03_crud/pages/Agregar/agregarvuelo_page.dart';
import 'package:parcial03_crud/pages/Listas/listavuelo_page.dart';

class VueloPage extends StatefulWidget {
  VueloPage({Key? key}) : super(key: key);

  @override
  _VueloPageState createState() => _VueloPageState();
}

class _VueloPageState extends State<VueloPage> {
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
                    builder: (context) => AgregarVueloPage(),
                  ),
                )
              },
              child: Text('Agregar', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.teal),
            )
          ],
        ),
      ),
      body: ListaVueloPage(),
    );
  }
}
