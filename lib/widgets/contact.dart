import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/Custom_Textfield.dart';
import 'dart:js' as js;


import 'custom_button.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});


  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: Colors.transparent,
      child: Column(
        children: [
          //title
          Container(
            width:screenWidth,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white24, // Set background color of the box
              borderRadius: BorderRadius.circular(50), // Add border radius to the box
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: RichText(text: TextSpan(
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Preah',
                      fontSize: 20),
                  children: [
                    TextSpan(text: 'Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              )),

            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child:LayoutBuilder(
              builder: (context,constraints){
                if(constraints.maxWidth>=kMinDesktopWidth){
                  return buildNameEmailDesktop();
                }
                  return buildNameEmailMobile();

              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //send button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
            ),
            child: CustomButton(
              text: 'Get in Touch',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Message sent successfully'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: const Divider()),
          const SizedBox(
            height: 15,
          ),
          //sns icon button
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
    );
  }
  Row buildNameEmailDesktop(){
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
          ),
        ),
      ],
    );

  }
  Column buildNameEmailMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            hintText: "Your name",
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(
          child: CustomTextField(
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
}
