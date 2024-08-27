import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: 300,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const Text(
                  "Made by Joshua CS with Flutter 3.24.1",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
              );
  }
}