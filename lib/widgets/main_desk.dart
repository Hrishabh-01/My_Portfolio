import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_animation.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'custom_button.dart';
import 'dart:js' as js;

class MainDesk extends StatefulWidget {
  const MainDesk({Key? key}) : super(key: key);
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
  _MainDeskState createState() => _MainDeskState();
}

class _MainDeskState extends State<MainDesk>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 2000)); // Increased duration
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth / 30),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: screenWidth/14,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: screenWidth / 14 - 4,
                backgroundImage: AssetImage('assets/images/self.jpg'),
              ),),
              const SizedBox(width: 100,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  RichText(text: TextSpan(
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Preah',
                        fontSize: screenWidth /40),
                    children: [
                      TextSpan(text: 'I Am '),
                      TextSpan(text: 'Hrishabh Agrawal ',
                        style: TextStyle(color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold)
                      )
                    ]
                  )),
                  SizedBox(height: 20,),

                  LoopingAnimation(
                    controller: _controller,
                    duration: Duration(
                        milliseconds: 500), // Duration of one cycle of animation
                    builder: (context, animation) {
                      return RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.2,
                                fontFamily: 'Preah',
                                fontSize: MediaQuery.of(context).size.width /20,
                                fontWeight: FontWeight.bold),
                            children: [
                              const TextSpan(text: 'Crafting code to bring\n'),
                              const TextSpan(text: 'ideas to '),
                              TextSpan(
                                  text: 'life',
                                  style: TextStyle(color: Colors.yellowAccent)),
                                 TextSpan(text: '...'.substring(0,(animation.value* "...".length).round()))
                            ]),
                      );
                      // Text(
                      //   "Crafting code to bring\n ideas to life... ".substring(
                      //       0,
                      //       (animation.value * "Crafting code to bring\n ideas to life...".length)
                      //           .round()),
                      //   style: TextStyle(
                      //     fontSize: MediaQuery.of(context).size.width /30,
                      //     height: 1.5,
                      //     fontWeight: FontWeight.w900,
                      //     color: Colors.yellow,
                      //     fontFamily: 'Preah',
                      //   ),
                      // );
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 300,
                    child: CustomButton(
                      text: 'Get in Touch',
                      onPressed: () {
                        // Handle button tap
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Message sent successfully'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        String name = 'John Doe';
                        String email = 'john@example.com';
                        String message = 'Hello, this is a test message!';
                        MainDesk().submitForm(
                          name: name,
                          email: email,
                          message: message,
                        );
                      },
                    ),
                  )
                ],
              ),

            ],
          ),
          const SizedBox(height: 60,),
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "I'm a Flutter Developer & ",
               style: TextStyle(
                   color: Colors.white,
                   height: 1.2,
                   fontFamily: 'Preah',
                   fontSize: screenWidth / 28),
             ),
             RichText(
               text: TextSpan(
                   style: TextStyle(
                       color: Colors.white,
                       height: 1.2,
                       fontFamily: 'Preah',
                       fontSize: screenWidth / 44,
                       fontWeight: FontWeight.bold),
                   children: const [
                     TextSpan(
                         text: ' a Tech Enthusiast ',
                         style: TextStyle(
                             backgroundColor: Colors.yellowAccent,
                             color: Colors.black)),
                     TextSpan(
                         text: ' who loves sharing his coding journey!')
                   ]),
             ),
             const SizedBox(height: 20),
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
                       width: 28,
                     )),
                 InkWell(
                     onTap: () {
                       js.context.callMethod('open',[SnsLinks.linkedIn]);
                     },
                     child: Image.asset(
                       "assets/images/linkedin1.png",
                       width: 28,
                     )),
                 InkWell(
                     onTap: () {
                       js.context.callMethod('open',[SnsLinks.instagram]);
                     },
                     child: Image.asset(
                       "assets/images/instagram1.png",
                       width: 28,
                     )),
                 InkWell(
                     onTap: () {
                       js.context.callMethod('open',[SnsLinks.telegram]);
                     },
                     child: Image.asset(
                       "assets/images/telegram.png",
                       width: 28,
                     )),
               ],
             ),
           ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LoopingAnimation extends StatefulWidget {
  final AnimationController controller;
  final Duration duration;
  final Widget Function(BuildContext context, Animation<double> animation)
      builder;

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
