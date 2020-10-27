import 'package:dio/dio.dart';
import 'package:estados_cidades_flutter/models/Estado.dart';

class EstadosService {
  Future<List<Estado>> listarEstados() async {
    var url =
        "https://horadedoar.back4app.io/classes/Estadoscidadesbrasil_StateProvince/";

    final headers = {
      'contentType': 'application/json',
      'X-Parse-Application-Id': 'V9Mm0H33vvKLM5kpE7UpHKYmMRsdbvgRF1n8dwOh',
      'X-Parse-REST-API-Key': 'KbkBxE4oPe67jbLw1wHl9yCEtYJqF8AP1RMOD59q'
    };

    Response response =
        await Dio().get(url, options: Options(headers: headers));

    await Future.delayed(Duration(seconds: 1));

    return (response.data['results'] as List)
        .map((estados) => Estado.fromJson(estados))
        .toList();
  }
}
