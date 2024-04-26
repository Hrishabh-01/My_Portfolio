import 'dart:js';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: Colors.transparent,
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width:screenWidth,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white24, // Set background color of the box
              borderRadius: BorderRadius.circular(50), // Add border radius to the box
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child:  RichText(text: TextSpan(
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Preah',
                      fontSize: 20),
                  children: [
                    TextSpan(text: 'About',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              )),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            alignment: Alignment.center,
            child: RichText(text: TextSpan(
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Preah',
                  fontSize: 20),
              children: [
                TextSpan(text: "As a third-year B.Tech student majoring in Computer Science and Engineering, I'm passionate about technology and problem-solving. I'm currently in the process of learning Flutter development, and my academic background equips me with strong problem-solving skills. I'm enthusiastic about honing my development skills and applying them to real-world challenges. Open to internships, projects, and collaborations, I'm eager to connect with like-minded individuals in the tech community to share insights, learn, and explore opportunities for innovation.")
              ]
            )),
          )
        ],
      ),
    );
  }
}
