import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,  // Changed to center
        children: [
          // avatar img
          Image.asset("assets/2-removebg-preview.png"),
          const SizedBox(height: 20),  // Add some space between image and text
          Center(  // Wrap the rest in a Center widget
            child: Column(
              children: [
                //intro text
                const Text(
                  "Joshua Scott\nFull-Stack Developer\nCoding Enthusiast",
                  textAlign: TextAlign.center,  // Center align the text
                  style: TextStyle(
                    fontSize: 24.0,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 15),
                // contact btn
                SizedBox(
                  width: 180.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.yellowPrimary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Get in touch"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
  );}
}