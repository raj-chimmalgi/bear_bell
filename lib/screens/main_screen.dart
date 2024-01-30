import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: MaterialButton(
                  onPressed: () {},
                  child: FaIcon(
                    FontAwesomeIcons.bell,
                    size: 50,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
