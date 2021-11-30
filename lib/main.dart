import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/compras.dart';
import 'package:login/segunda.dart';
import 'package:login/buscar.dart';
import 'package:login/registrar.dart';
import 'package:login/carrito.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.black
            )
        ),
        home: Pantalla()
    );
  }
}

class Pantalla extends StatefulWidget {
  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  final usuario = TextEditingController();
  final password = TextEditingController();
  String usu = '';
  String pas = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App Login'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent
                ),
                accountName: Text('Usuario'),
                accountEmail: Text('NA'),
                currentAccountPicture: Image.asset('img/user.png'),
              ),
              ListTile(
                  title: Text('Buscar'),
                leading: Image.asset('img/lupa.jpg'),
                onTap: (){
                    Navigator.of(context).pop;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => listar()));
                },
              ),
              ListTile(
                title: Text('Compras'),
                leading: Image.asset('img/carrito.jpg'),
                onTap: (){
                  Navigator.of(context).pop;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => compras()));
                },
              ),
              ListTile(
                title: Text('Registrar'),
                leading: Image.asset('img/registrar.jpg'),
                onTap: (){
                  Navigator.of(context).pop;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => registro()));
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset('img/cycle.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: usuario,
                decoration: InputDecoration(
                  hintText: 'Usuario'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    onSurface: Colors.black,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                    ),

                ),
                onPressed: () {
                  usu = usuario.text;
                  pas = password.text;
                  if(usu == 'pepe' && pas == '123'){
                    //print('Bienvenido ' + usu);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => listar()));
                        //MaterialPageRoute(builder: (context) => buscar()));
                  }
                },
                child: Text('Ingresar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
                )),
              )
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    onSurface: Colors.black,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                    ),

                  ),
                  onPressed: () {
                    usu = usuario.text;
                    pas = password.text;
                    if(usu == 'pepe' && pas == '123'){
                      //print('Bienvenido ' + usu);
                      Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => Nueva()));
                          MaterialPageRoute(builder: (context) => buscar()));
                    }
                  },
                  child: Text('Buscar',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      )),
                )
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    onSurface: Colors.black,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                    ),

                  ),
                  onPressed: () {
                    usu = usuario.text;
                    pas = password.text;
                    if(usu == 'pepe' && pas == '123'){
                      //print('Bienvenido ' + usu);
                      Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => Nueva()));
                          MaterialPageRoute(builder: (context) => registro()));
                    }
                  },
                  child: Text('Registrar',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      )),
                )
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    onSurface: Colors.black,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                    ),

                  ),
                  onPressed: () {
                    usu = usuario.text;
                    pas = password.text;
                    if(usu == 'pepe' && pas == '123'){
                      //print('Bienvenido ' + usu);
                      Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => Nueva()));
                          MaterialPageRoute(builder: (context) => compras()));
                    }
                  },
                  child: Text('Comprar',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      )),
                )
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    onSurface: Colors.black,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontStyle: FontStyle.italic
                    ),

                  ),
                  onPressed: () {
                    usu = usuario.text;
                    pas = password.text;
                    if(usu == 'pepe' && pas == '123'){
                      //print('Bienvenido ' + usu);
                      Navigator.push(
                          context,
                          //MaterialPageRoute(builder: (context) => Nueva()));
                          MaterialPageRoute(builder: (context) => micompra()));
                    }
                  },
                  child: Text('Carrito',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                      )),
                )
            )
          ],
        )
      );
  }
}
