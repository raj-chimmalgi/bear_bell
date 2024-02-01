import 'package:bear_bell/services/bearBell.dart';
import 'package:bear_bell/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/volumeControl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool hiking = false;

  BearBell bearBell = BearBell();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        setState(() {
                          hiking = !hiking;
                        });
                        await bearBell.startEndHike(hiking);
                      },
                      color: Colors.green.withOpacity(.5),
                      shape: const CircleBorder(),
                      height: 100,
                      child: const FaIcon(
                        FontAwesomeIcons.bell,
                        size: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        VolumeControl(
                          volumeIcon: const Icon(Icons.volume_up),
                          onPressed: () {
                            bearBell.incDecVolume(VolumeCommandEnum.increase);
                          },
                        ),
                        const SizedBox(height: 10),
                        VolumeControl(
                          volumeIcon: const Icon(Icons.volume_down),
                          onPressed: () {
                            bearBell.incDecVolume(VolumeCommandEnum.decrease);
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
