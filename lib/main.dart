import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/src/rendering/box.dart';

/* iniciando APP */
void main (){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Todo(),
  ));
}
//* iniciando APP */

/* Widget STFULL */
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

/*************************************************/

class _TodoState extends State<Todo> {

  List _toDolist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nova Tarefa",
                        labelStyle: TextStyle(color: Colors.indigoAccent)
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.indigoAccent,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: (){},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /* Função que retorna arquivo para salvar */
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  //* Função que retorna arquivo para salvar */


  /* Função que salva os dados no arquivo data.json */
  Future<File> _savedata() async {
    String data = json.encode(_toDolist);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  //* Função que salva os dados no arquivo data.json */


  /* Função para ler os dados no data.json */
  Future<String?> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    }catch (e){
      return null;
    }
  }

  //* Função para ler os dados no data.json */

}
//* Widget STFULL */




