import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/service/api_manager/api_manager.dart';
import 'package:islami/core/service/models/radio_list.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radioList = [];
  int currentIndex = 0;
  final player = AudioPlayer();
  bool isLoading = true;
  bool isPlaying = false;

  Future<void> getRadioList() async {
    try {
      var response = await ApiManager.getRadioList();
      radioList = response;
      isLoading = false;
    } catch (e) {
      log(e.toString());
      isLoading = false;
    }
    notifyListeners();
  }

  play() {
    if (player.state == PlayerState.playing) {
      player.pause();
      isPlaying = false;
    } else if (player.state == PlayerState.paused) {
      player.resume();
      isPlaying = true;
    } else {
      player.play(UrlSource(radioList[currentIndex].url ?? ''));
      isPlaying = true;
    }
    notifyListeners();
  }

  next() {
    if (currentIndex == radioList.length - 1) {
      return;
    }
    currentIndex++;
    player.stop();
    player.play(UrlSource(radioList[currentIndex].url ?? ''));
    isPlaying = true;
    notifyListeners();
  }

  prev() {
    if (currentIndex == 0) {
      return;
    }
    currentIndex--;
    player.stop();
    player.play(UrlSource(radioList[currentIndex].url ?? ''));
    isPlaying = true;
    notifyListeners();
  }
}
