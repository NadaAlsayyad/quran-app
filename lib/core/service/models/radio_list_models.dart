import 'package:islami/core/service/models/radio_list.dart';

class RadioListModel {
  List<RadioModel>? radios;

  RadioListModel({this.radios});

  RadioListModel.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <RadioModel>[];
      json['radios'].forEach((v) {
        radios!.add(new RadioModel.fromJson(v));
      });
    }
  }
}
