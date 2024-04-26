import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_button.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/side_logo.dart';

class HeaderDesk extends StatelessWidget {
  const HeaderDesk({super.key, required this.onNavMenuTap,});
  final Function(int) onNavMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: (){},),
          const Spacer(),
          for (int i = 0; i < navTiles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () {
                    onNavMenuTap(i);
                  },
                  child: Text(
                    navTiles[i],
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whitePrimary),
                  )),
            ),
        ],
      ),
    );
  }
}
