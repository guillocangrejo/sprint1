import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/detalle.dart'; // Manejar los json como string

class listar extends StatelessWidget {
  const listar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.lightGreenAccent,
                foregroundColor: Colors.black
            )
        ),
        home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/segunda.jpg'),
                  fit: BoxFit.fitHeight
              )
          ),
            child:Scaffold(
              appBar: AppBar(
                title: Text('Negocios aliados'),
              ),
              body:(
                  Consultar()
              ),
            )
        )
    );
  }
}

class Consultar extends StatefulWidget {

  @override
  _ConsultarState createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  final Stream<QuerySnapshot> consulta = FirebaseFirestore.instance.collection('negocios').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: consulta,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if (snapshot.hasError) {
          return Text('Existe error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Cargando");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document)
            {
              Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
                return Container(

                  color: Colors.black.withOpacity(0.8),
                  margin: EdgeInsets.only(top:15),
                  child: ListTile(
                    title: Text(data['nombre'],
                    style: TextStyle(
                      fontFamily: 'fontbold',
                      color: Colors.lightGreenAccent,
                      fontSize: 20,
                    ),
                    ),
                    subtitle: Text(data['direccion'],
                      style: TextStyle(
                          fontFamily: 'fontlight',
                          color: Colors.lightGreenAccent,
                          fontSize: 18,
                      ),),
/*                    leading: Icon(
                      Icons.home,
                      color: Colors.lightGreenAccent,
                      size: 30,
                    ),*/
                      leading: Image.network(data['imagen']),
                      onTap: (){
                        negocio nego = negocio(data['actividad'], data['categoria'], data['celular'], data['codigo'],
                            data['direccion'], data['geolocalizacion'], data['imagen'], data['nombre'],
                            data['pagina_web'], data['telefono']);
                        Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => descripcion(nego:nego))
                            //builder: (context)=>descripcion(data['nombre']+" \n"+data['imagen']))
                        );
                      },
                  )
                );
            }
          ).toList()
        );
      }
    );
  }
}