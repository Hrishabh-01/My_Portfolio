import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

import '../constants/sns_links.dart';
import 'custom_button.dart';
import 'dart:js' as js;


class MainMob extends StatefulWidget {
  const MainMob({super.key});
  void submitForm({
    required String name,
    required String email,
    required String message,
  }) {
    final googleFormUrl = 'https://forms.gle/CrqZBpZiYa2yknvU8';
    final url = '$googleFormUrl?entry.123456789=$name&entry.987654321=$email&entry.246813579=$message';
    js.context.callMethod('open', [url]); // Open the Google Form URL
  }

  @override
  State<MainMob> createState() => _MainMobState();
}

class _MainMobState extends State<MainMob> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;




  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4000)); // Increased duration
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final String _introText = "Hi,\nI'm Hrishabh Ag";
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      height: screenSize.height,
      constraints: const BoxConstraints(
        minHeight: 460.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.2),
                  CustomColor.scaffoldBg.withOpacity(0.8),
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: CircleAvatar(
                radius: screenWidth/4,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: screenWidth / 4 - 3,
                  backgroundImage: AssetImage('assets/images/self.jpg'),
                ),),
          ),
          SizedBox(
            height: 40,
          ),
          RichText(text: TextSpan(
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Preah',
                  fontSize: screenWidth /20),
              children: [
                TextSpan(text: 'I Am '),
                TextSpan(text: 'Hrishabh Agrawal ',
                    style: TextStyle(color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold)
                )
              ]
          )),
          LoopingAnimation(
            controller: _controller,
            duration: Duration(milliseconds: 4000), // Duration of one cycle of animation
            builder: (context, animation) {
              return Text(
                "A Flutter Developer".substring(0, (animation.value * "A Flutter Developer".length).round()),
                style: const TextStyle(
                  fontSize: 30.0,
                  height: 1.5,
                  fontWeight: FontWeight.w900,
                  color: Colors.yellow,
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            child: CustomButton(
              text: 'Get in Touch',
              onPressed: () {
                String name = 'John Doe';
                String email = 'john@example.com';
                String message = 'Hello, this is a test message!';
                MainMob().submitForm(
                  name: name,
                  email: email,
                  message: message,
                );
              },
            ),
          ),
          SizedBox(height: 20,),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.github]);
                  },
                  child: Image.asset(
                    "assets/images/github1.png",
                    width: 40,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.linkedIn]);
                  },
                  child: Image.asset(
                    "assets/images/linkedin1.png",
                    width: 40,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.instagram]);
                  },
                  child: Image.asset(
                    "assets/images/instagram1.png",
                    width: 40,
                  )),
              InkWell(
                  onTap: () {
                    js.context.callMethod('open',[SnsLinks.telegram]);
                  },
                  child: Image.asset(
                    "assets/images/telegram.png",
                    width: 40,
                  )),
            ],
          ),




        ],
      ),
    );
  }
}
class LoopingAnimation extends StatefulWidget {
  final AnimationController controller;
  final Duration duration;
  final Widget Function(BuildContext context, Animation<double> animation) builder;

  const LoopingAnimation({
    Key? key,
    required this.controller,
    required this.duration,
    required this.builder,
  }) : super(key: key);

  @override
  _LoopingAnimationState createState() => _LoopingAnimationState(controller);
}

class _LoopingAnimationState extends State<LoopingAnimation> {
  late Animation<double> _animation;
  late AnimationController _controller;

  _LoopingAnimationState(this._controller);

  @override
  void initState() {
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return widget.builder(context, _animation);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}