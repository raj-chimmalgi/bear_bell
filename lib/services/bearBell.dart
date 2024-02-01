import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

import '../utils/constants.dart';

class BearBell {
  final player = AudioPlayer();
  double? previousVolume;

  Future<void> setMaxVolume() async {
    previousVolume = await FlutterVolumeController.getVolume();
    await FlutterVolumeController.setVolume(1);
  }

  Future<void> setVolumeToPreviousState() async {
    if (previousVolume != null) {
      await FlutterVolumeController.setVolume(previousVolume!);
    }
  }

  Future<void> startEndHike(bool hiking) async {
    if (hiking) {
      await setMaxVolume();
      await player.play(
        AssetSource('sounds/bell_wind_chimes.mp3'),
      );
    } else {
      await player.stop();
      await setVolumeToPreviousState();
    }
  }

  Future<void> incDecVolume(VolumeCommandEnum volumeCommand) async {
    volumeCommand == VolumeCommandEnum.increase
        ? await FlutterVolumeController.raiseVolume(.15)
        : await FlutterVolumeController.lowerVolume(.15);
  }
}
