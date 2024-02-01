import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum eVolumeCommand { increase, decrease }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final player = AudioPlayer();
  bool hiking = false;
  double? previousVolume;

  // bool isMoving = false;

  @override
  void initState() {
    super.initState();
    // initAccelerometer();
  }

  Future<void> setMaxVolume() async {
    //todo: reset volume back to before app started?
    // if (!mounted) return;

    previousVolume = await FlutterVolumeController.getVolume();

    await FlutterVolumeController.setVolume(1);
  }

  Future<void> setVolumeToPreviousState() async {
    if (previousVolume != null) {
      await FlutterVolumeController.setVolume(previousVolume!);
    }
  }

  Future<void> startEndHike() async {
    if (hiking) {
      await setMaxVolume();
      await player.play(
        AssetSource('sounds/bell_wind_chimes.mp3'),
      );
    } else {
      await player.stop();
      await setVolumeToPreviousState();
    }

    setState(() {
      hiking = !hiking;
    });
  }

  Future<void> incDecVolume(eVolumeCommand volumeCommand) async {
    volumeCommand == eVolumeCommand.increase
        ? await FlutterVolumeController.raiseVolume(.15)
        : await FlutterVolumeController.lowerVolume(.15);
  }

  // void initAccelerometer() {
  //   userAccelerometerEventStream()
  //       //.throttleDuration(const Duration(milliseconds: 500))
  //       .listen((UserAccelerometerEvent event) {
  //     // Adjust the threshold value based on your sensitivity requirements
  //
  //     double threshold = 5.0;
  //
  //     setState(() {
  //       isMoving = (event.x.abs() > threshold ||
  //           event.y.abs() > threshold ||
  //           event.z.abs() > threshold);
  //       print(isMoving);
  //     });
  //     //
  //     // if (_isMoving) {
  //     //   _playSound();
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        await startEndHike();
                      },
                      color: Colors.green.withOpacity(.5),
                      shape: CircleBorder(),
                      height: 100,
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        IconButton.filled(
                          icon: const Icon(Icons.volume_up),
                          iconSize: 40,
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.grey.withOpacity(.5),
                            ),
                          ),
                          onPressed: () {
                            incDecVolume(eVolumeCommand.increase);
                          },
                        ),
                        SizedBox(height: 10),
                        IconButton.filled(
                          icon: const Icon(Icons.volume_down),
                          iconSize: 40,
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.grey.withOpacity(.5),
                            ),
                          ),
                          onPressed: () {
                            incDecVolume(eVolumeCommand.decrease);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
