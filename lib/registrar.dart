import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registro extends StatefulWidget {
  const registro({Key? key}) : super(key: key);

  @override
  _registroState createState() => _registroState();
}

class _registroState extends State<registro> {
  final codigo = TextEditingController();
  final nombre = TextEditingController();
  final direccion = TextEditingController();
  final telefono = TextEditingController();
  final celular = TextEditingController();

  CollectionReference clien = FirebaseFirestore.instance.collection('clientes');


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.black
            )
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clientes')
        ),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: codigo,
                  decoration: InputDecoration(
                    hintText: 'Codigo'
                  ),
                )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nombre,
                    decoration: InputDecoration(
                        hintText: 'Nombre'
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: direccion,
                    decoration: InputDecoration(
                        hintText: 'Direccion'
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: telefono,
                    decoration: InputDecoration(
                        hintText: 'Telefono'
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: celular,
                    decoration: InputDecoration(
                        hintText: 'Celular'
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: Text('Registrar',
                    textAlign: TextAlign.center),
                    icon: Icon(Icons.ac_unit,
                    size : 20),

                    onPressed: () {
                      if(codigo.text.isEmpty || nombre.text.isEmpty || direccion.text.isEmpty || telefono.text.isEmpty || celular.text.isEmpty){
                        Fluttertoast.showToast(msg: 'Ingresar todos los datos', toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
                      }
                      else{
                        clien.doc(codigo.text).set({
                          'nombre': nombre.text,
                          'direccion': direccion.text,
                          'telefono': telefono.text,
                          'celular': celular.text,
                        });
                        Fluttertoast.showToast(
                            msg: 'Datos guardados correctamente',
                            fontSize: 20, backgroundColor: Colors.white,
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      onSurface: Colors.black,
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: Text('Actualizar',
                        textAlign: TextAlign.center),
                    icon: Icon(Icons.ac_unit,
                        size : 20),

                    onPressed: () {
                        clien.doc(codigo.text).update({
                          'nombre': nombre.text,
                          'direccion': direccion.text,
                          'telefono': telefono.text,
                          'celular': celular.text,
                        });
                        Fluttertoast.showToast(
                            msg: 'Datos actualizados correctamente',
                            fontSize: 20, backgroundColor: Colors.white,
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER
                        );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      onSurface: Colors.black,
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: Text('Eliminar',
                        textAlign: TextAlign.center),
                    icon: Icon(Icons.ac_unit,
                        size : 20),

                    onPressed: () {
                      clien.doc(codigo.text).delete();
                      Fluttertoast.showToast(
                          msg: 'Datos eliminados correctamente',
                          fontSize: 20, backgroundColor: Colors.white,
                          textColor: Colors.black,
                          toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent,
                      onSurface: Colors.black,
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  )
              )
            ]
        )
      )
    );
  }
}
