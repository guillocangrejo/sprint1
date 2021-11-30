import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/carrito.dart';

class compras extends StatefulWidget {
  const compras({Key? key}) : super(key: key);

  @override
  _comprasState createState() => _comprasState();
}

class _comprasState extends State<compras> {
  TextEditingController buscar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.black
            )
        ),
      home:Scaffold(
        appBar: AppBar(
          title: Text('Compras'),
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Digite el nombre del almacen'
                    ),
                  ),
                ),
                Expanded(
                  child: buscarprod(
                    text: buscar.text,
                  )
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}

class buscarprod extends StatelessWidget {
  final String text;
  final List lista = [];
  buscarprod({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar = FirebaseFirestore.instance.collection('productos').where('almacen', isEqualTo:text).snapshots();

    return Column(
      children: [
        Expanded(
          flex: 3,
          child:
          StreamBuilder<QuerySnapshot>(
            stream: consultar,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document)
                    {
                      Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
                      return Container(

                          color: Colors.black.withOpacity(0.8),
                          margin: EdgeInsets.only(top:5),
                          child: ListTile(
                            title: Text(data['nombre'],
                              style: TextStyle(
                                fontFamily: 'fontbold',
                                color: Colors.lightGreenAccent,
                                fontSize: 20,
                              ),
                            ),
                            //subtitle: Text(data['telefono'],
                            subtitle: Text('Precio: COP  ' + data['precio'],
                              style: TextStyle(
                                fontFamily: 'fontlight',
                                color: Colors.lightGreenAccent,
                                fontSize: 18,
                              ),
                            ),
                            leading: Icon(
                              Icons.home,
                              color: Colors.lightGreenAccent,
                              size: 30,
                            ),
                            onTap: (){
                              lista.add([data['nombre'], data['precio']]);
                              print(lista);
                            },
                          )
                      );
                    }
                    ).toList()
                );
            }
            ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            //color: Colors.indigo,
            height: 100,
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: Icon(Icons.local_grocery_store,
                size: 30,
                color: Colors.lightGreenAccent),
                label: Text('Agregar al carrito',
                textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                  onPrimary: Colors.lightGreenAccent,
                  onSurface: Colors.teal,
                  elevation: 10,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  textStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontStyle: FontStyle.normal
                  )
                ),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => listacompras(lista:lista)));
              },
            ),
          )
        ),
      ],
    );
  }
}

