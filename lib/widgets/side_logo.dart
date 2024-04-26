import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key,this.onTap,});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Lottie.asset('assets/images/animation1.json'),
           Text(
            "<HΔ/>",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline,
                color: CustomColor.yellowSecondary),
          ),
        ],
      ),
    );
  }
}
