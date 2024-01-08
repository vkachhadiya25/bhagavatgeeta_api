import 'dart:convert';
import 'package:bhagavatgeeta_api/screen/home/model/home_model.dart';
import 'package:bhagavatgeeta_api/screen/shlok/model/shlok_model.dart';
import 'package:http/http.dart' as http;

class JsonHelper {
  Future<List?> gitaAPICall() async {
    var gita = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/";
    var response = await http.get(Uri.parse(gita), headers: {
      'X-RapidAPI-Key': '6fac1e67b4mshbbdfe31aeaf3e54p1f8950jsnace31f91abe9',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      var gita = jsonDecode(response.body);
      List<dynamic>? modelList =
          gita.map((e) => HomeModel.mapToModel(e)).toList();
      return modelList;
    }
    return null;
  }

  Future<dynamic>? shlokAPICall() async {
    var shlok = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/1/verses/1/";
    var response = await http.get(Uri.parse(shlok), headers: {
      'X-RapidAPI-Key': '6fac1e67b4mshbbdfe31aeaf3e54p1f8950jsnace31f91abe9',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      var shlok = jsonDecode(utf8.decode(response.bodyBytes));
      ShlokModel shlokModel = ShlokModel.mapToModel(shlok);
      return shlokModel;
    }
    return null;
  }
}
