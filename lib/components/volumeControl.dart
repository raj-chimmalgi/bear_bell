import 'package:flutter/material.dart';

class VolumeControl extends StatelessWidget {
  const VolumeControl(
      {super.key, required this.volumeIcon, required this.onPressed});

  final Icon volumeIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      icon: volumeIcon,
      iconSize: 40,
      color: Colors.white,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          Colors.grey.withOpacity(.5),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
