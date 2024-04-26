import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_button.dart';

class DrawerMob extends StatelessWidget {
  const DrawerMob({super.key, required this.onNavItemTap,});
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
    backgroundColor: CustomColor.scaffoldBg,
    child: ListView(
    children: [
    Align(
    alignment: Alignment.centerLeft,
    child: Padding(
    padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
    child: IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: const Icon(Icons.close)),
    ),
    ),
    for(int i=0;i<navIcons.length;i++)
  ListTile(
  contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
  leading: Icon(navIcons[i]),
  title: Text(navTiles[i],style:const TextStyle(color: CustomColor.whitePrimary,fontWeight: FontWeight.w600,fontSize: 16),),
  onTap: (){
    onNavItemTap(i);
  },
  )
  ],
  ),
  );
  }
}
