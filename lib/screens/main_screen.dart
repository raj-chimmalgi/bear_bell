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
                        setState(() {
                          hiking = !hiking;
                        });
                        await bearBell.startEndHike(hiking);
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
                        VolumeControl(
                          volumeIcon: Icon(Icons.volume_up),
                          onPressed: () {
                            bearBell.incDecVolume(VolumeCommandEnum.increase);
                          },
                        ),
                        SizedBox(height: 10),
                        VolumeControl(
                          volumeIcon: Icon(Icons.volume_down),
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
