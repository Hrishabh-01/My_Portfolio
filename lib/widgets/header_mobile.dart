import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/side_logo.dart';

class HeaderMob extends StatelessWidget {
  const HeaderMob({super.key,this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap,),
          const Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu),
          ),
          const SizedBox(width: 15,)
        ],
      ),
    );
  }
}
