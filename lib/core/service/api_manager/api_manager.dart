import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/core/service/models/radio_list.dart';

import '../models/radio_list_models.dart';

class ApiManager {
  static Future<List<RadioModel>> getRadioList() async {
    http.Response response =
        await http.get(Uri.parse('http://mp3quran.net/api/v3/radios'));

    var jsonData = jsonDecode(response.body);

    return RadioListModel.fromJson(jsonData).radios ?? [];
  }
}
