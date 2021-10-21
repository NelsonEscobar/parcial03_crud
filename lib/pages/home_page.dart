import 'package:flutter/material.dart';
import 'package:parcial03_crud/pages/viewclientes_page.dart';
import 'package:parcial03_crud/pages/viewreservas_page.dart';
import 'package:parcial03_crud/pages/viewvuelos_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(              
        body: Stack(
          children: <Widget>[  
            banners(),
            body(),
            
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 220),
              padding: EdgeInsets.all(90.0),
              child: GridView.count(crossAxisCount: 1,
              children: <Widget>[
                Card(
                  color: Colors.teal.shade300,
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ClientePage()));
                    },
                    splashColor: Colors.teal.shade300,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.account_circle_rounded, size:100,),
                          Text("Clientes", style :new TextStyle(fontSize:25 ))
                        ],
                      ),
                    ),
                  ),
                ),
                 Card(
                  color: Colors.teal.shade300,
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReservasPage()));
                    },
                    splashColor: Colors.teal.shade400,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.calendar_today , size:100,),
                          Text("Reservas", style :new TextStyle(fontSize:25))
                        ],
                      ),
                    ),
                  ),
                ),
               
                Card(
                  color:Colors.teal.shade300,
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VueloPage()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.airplane_ticket, size:100),
                          Text("Vuelos", style :new TextStyle(fontSize:23.2 ))
                        ],
                      ),
                    ),
                  ),
                ),
               
              ],),
            ),
            
          ],
        ),
      );
  }
 

}


Widget banners(){
  return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade200,
                    Colors.amber.shade200,
                  ],
                ),
              ),
              child: Image.network("https://www.viasat.com/content/dam/mx-site/images/Hero_Banner_%20Aviation1_001.jpg", height: 235, fit: BoxFit.cover,),
            );
}


Widget body(){
  
  return Container(
    
                  transform: Matrix4.translationValues(0, 200, 1),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)
                    )
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      
                      //Icon(Icons.person_add_alt_1),
                      
                      Text('Parcial 03: Aerolinea',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      
                      Text('Administrar una opción',style: TextStyle(fontSize: 20),)
                      
                    ],
                    )
                  ],
                  ),
                );
               
}