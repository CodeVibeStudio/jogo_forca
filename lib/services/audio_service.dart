// lib/services/audio_service.dart

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound(String soundPath) async {
    try {
      await _audioPlayer.play(AssetSource(soundPath));
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao reproduzir som $soundPath: $e');
      }
    }
  }
  
  void playCorrectSound({required bool soundEnabled}) {
    if (!soundEnabled) return;
    _playSound('sounds/correct.mp3');
  }

  void playWrongSound({required bool soundEnabled}) {
    if (!soundEnabled) return;
    _playSound('sounds/wrong.mp3');
  }

  void playVictorySound({required bool soundEnabled}) {
    if (!soundEnabled) return;
    _playSound('sounds/victory.mp3');
  }

  void playDefeatSound({required bool soundEnabled}) {
    if (!soundEnabled) return;
    _playSound('sounds/defeat.mp3');
  }

  void playButtonSound({required bool soundEnabled}) {
    if (!soundEnabled) return;
    _playSound('sounds/button_click.mp3');
  }

  Future<void> stopAllSounds() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao parar sons: $e');
      }
    }
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}