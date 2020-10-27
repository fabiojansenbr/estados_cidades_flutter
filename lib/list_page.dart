import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:estados_cidades_flutter/models/Cidade.dart';

import 'package:flutter/material.dart';
import 'models/Estado.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String estadoId;

  bool campoEnabled = false;

  void _habilitaCampo(bool value) {
    setState(() {
      campoEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownSearch<Estado>(
              maxHeight: 300,
              onFind: (String filter) => getEstados(),
              label: "Estado",
              onChanged: (estado) {
                print(estado.name);
                print(estado.objectId);

                estadoId = estado.objectId;
              },
              showSearchBox: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownSearch<Cidade>(
              maxHeight: 300,
              onFind: (String filter) => getCidades(),
              label: "Cidades",
              onChanged: (cidade) {
                print(cidade.objectId);
                print(cidade.name);
              },
              showSearchBox: true,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Future<List<Estado>> getEstados() async {
    final headers = {
      'contentType': 'application/json',
      'X-Parse-Application-Id': 'V9Mm0H33vvKLM5kpE7UpHKYmMRsdbvgRF1n8dwOh',
      'X-Parse-REST-API-Key': 'KbkBxE4oPe67jbLw1wHl9yCEtYJqF8AP1RMOD59q'
    };

    var response = await Dio().get(
        "https://horadedoar.back4app.io/classes/Estados?order=name",
        options: Options(headers: headers));

    var models = Estado.fromJsonList(response.data['results']);
    return models;
  }

  Future<List<Cidade>> getCidades() async {
    final where = Uri.encodeQueryComponent(jsonEncode({
      "state": {
        "__type": "Pointer",
        "className": "Estados",
        "objectId": estadoId
      }
    }));

    final headers = {
      'contentType': 'application/json',
      'X-Parse-Application-Id': 'V9Mm0H33vvKLM5kpE7UpHKYmMRsdbvgRF1n8dwOh',
      'X-Parse-REST-API-Key': 'KbkBxE4oPe67jbLw1wHl9yCEtYJqF8AP1RMOD59q'
    };

    var response = await Dio().get(
        "https://horadedoar.back4app.io/classes/Cidades?order=name&limit=10000&where=$where",
        options: Options(headers: headers));

    var models = Cidade.fromJsonList(response.data['results']);
    return models;
  }
}
