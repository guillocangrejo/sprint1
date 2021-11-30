import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class micompra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.lightGreenAccent,
              foregroundColor: Colors.black
          )
      ),
      home: listacompras(lista: [],)
    );
  }
}

class listacompras extends StatefulWidget {
  List lista = [];

  listacompras({required this.lista});

  @override
  _listacomprasState createState() => _listacomprasState();
}

class _listacomprasState extends State<listacompras> {
  CollectionReference registrarproducto = FirebaseFirestore.instance.collection('compras');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.lista.length,
              itemBuilder: (BuildContext context, i){
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(1),
                      padding: EdgeInsets.all(1),
                      child: ListTile(
                        title: Text(widget.lista [i][0] +':    ' + widget.lista [i][1],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.lightGreenAccent,
                                fontStyle: FontStyle.italic
                            )
                        ),
                        tileColor: Colors.black
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              color: Colors.lightGreenAccent,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                      builder: (context){
                        return ElevatedButton.icon(
                          label: Text('Consultar total de la compra',
                              textAlign: TextAlign.center),
                          icon: Icon(Icons.payment,
                              size: 30,
                              color: Colors.lightGreenAccent),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.lightGreenAccent,
                              onSurface: Colors.black,
                              elevation: 10
                          ),
                          onPressed: (){
                            var total = 0;
                            var num;
                            for(int i=0; i < widget.lista.length; i++){
                              num = int.parse(widget.lista [i][1]);
                              total = num + total;
                            }
                            Fluttertoast.showToast(msg: 'El total de su compra es ' + total.toString(),
                            fontSize: 30,
                            backgroundColor: Colors.red,
                            textColor: Colors.purpleAccent,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER
                            );
                          },
                        );
                      }
                  )
                ],
              )
          ),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            color: Colors.lightGreenAccent,
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              label: Text('Registrar la compra',
                  textAlign: TextAlign.center),
              icon: Icon(Icons.payment,
                  size: 30,
                  color: Colors.lightGreenAccent),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.lightGreenAccent,
                  onSurface: Colors.black,
                  elevation: 10
              ),
              onPressed: (){
                var total = 0;
                var num;
                for(int i=0; i < widget.lista.length; i++){
                  num = int.parse(widget.lista [i][1]);
                  total = num + total;
                }
                List listaregistrar = [];
                for (int i=0; i < widget.lista.length; i++){
                  listaregistrar.add(widget.lista [i][0]);
                }
                registrarproducto.doc().set({
                  'Producto': listaregistrar,
                  'Total': total
                });
                Fluttertoast.showToast(msg: 'Su compra se registró con éxito',
                    fontSize: 30,
                    backgroundColor: Colors.red,
                    textColor: Colors.purpleAccent,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER
                );
              },
            )
          )
        ],
      )
    );
  }
}
