import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class buscar extends StatefulWidget {
  const buscar({Key? key}) : super(key: key);

  @override
  _buscarState createState() => _buscarState();
}

class _buscarState extends State<buscar> {

  TextEditingController buscar = TextEditingController();
  String bus = '';

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
          title: Text('Busqueda de Negocios'),
        ),
        body: Center(
          child: SizedBox(width: 360,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Digite el nombre del negocio'
                    )
                  )
                ),
                Expanded(
                    child: buscardato(
                      text: buscar.text,
                    )
                )
              ]
            )
          ),
        ),
      )
    );
  }
}

class buscardato extends StatelessWidget {
  final String text;
  const buscardato({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consulta = FirebaseFirestore.instance.collection('negocios').where('nombre', isEqualTo:text).snapshots();
    //final Stream<QuerySnapshot> consulta = FirebaseFirestore.instance.collection('negocios').where('telefono', arrayContainsAny: [text]).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: consulta,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (text.isNotEmpty) {
          //var t = text.toLowerCase();
          consulta;
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
                    subtitle: Text(data['direccion'] + '\n' + data['pagina_web'] + '\n' + data['telefono'],
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
                  )
              );
            }
            ).toList()
        );

      }
    );
  }
}
