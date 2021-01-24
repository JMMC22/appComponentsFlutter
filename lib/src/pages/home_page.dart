import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista()
    );
  }

  Widget _lista(){

    /* menuProvider.cargarData().then((opciones){
      print(opciones);
    }); */

    return FutureBuilder(  //FutureBuilder, controlamos que una vez finalizada la llamada asincrona, se asignen las opciones
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          return ListView(
            children: _crearItems(snapshot.data),
          );
      },
    );
  }

  List<Widget> _crearItems(List<dynamic> data){

    final List<Widget> opciones = [];

    data.forEach((element) {
      final widget = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
          
        },
      );

      opciones.add(widget);
      opciones.add(Divider());
    });

    return opciones;
  }
}
