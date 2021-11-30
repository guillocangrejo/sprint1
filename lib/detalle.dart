import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login/segunda.dart';

class descripcion extends StatefulWidget {
  //final String dato;
  //const descripcion(this.dato,{Key? key}) : super(key: key);
  late final negocio nego;
  descripcion({required this.nego});

  @override
  _descripcionState createState() => _descripcionState();
}

class _descripcionState extends State<descripcion> {
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
          title: Text('Descripcion'),
        ),
        body: Container(
          color: Colors.green,
          padding: EdgeInsets.all(20),
          height: 600,
          child: Card(
            elevation: 50,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            color: Colors.lightGreenAccent,
            child: Center(
              child: Column(
                children: [
                  Image.network(widget.nego.imagen, width: 250,),
                  //Image.asset('img/i5.jpg'),
                  Text(widget.nego.nombre, style: TextStyle(
                    fontFamily: 'fontbold',
                    color: Colors.black,
                    fontSize: 20,)),
                  Text(widget.nego.telefono),
                  Text(widget.nego.direccion),
                  Text(widget.nego.pagina_web),
                  Text(widget.nego.celular),
                  Text(widget.nego.categoria),
                  Text(widget.nego.geolocalizacion),
                  Container(
                    padding: EdgeInsets.all(50),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      label: Text('Ir a la web', textAlign: TextAlign.center,),
                      icon: const Icon(Icons.home,
                      size: 30,
                      color: Colors.lightGreenAccent,),
                      onPressed: ()async{
                        if(await canLaunch(widget.nego.pagina_web)){
                        await launch(widget.nego.pagina_web);
                        //if(await canLaunch('https://www.acompaname.com.co/')){
                          //await launch('https://www.acompaname.com.co/');
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


class negocio{
  String actividad = '';
  String categoria = '';
  String celular = '';
  String codigo = '';
  String direccion = '';
  String geolocalizacion = '';
  String imagen = '';
  String nombre = '';
  String pagina_web = '';
  String telefono = '';



  negocio(this.actividad, this.categoria, this.celular, this.codigo,
      this.direccion, this.geolocalizacion, this.imagen, this.nombre,
      this.pagina_web, this.telefono);

}