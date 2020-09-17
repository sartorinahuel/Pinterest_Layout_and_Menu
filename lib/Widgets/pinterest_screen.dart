import 'package:flutter/material.dart';
import 'package:pinterest_layout/Widgets/pinterest_grid.dart';
import 'package:pinterest_layout/Widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.home,
        onPressed: () {
          print("pie chart");
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print("search");
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print("notifications");
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print("supervised_user_circle");
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuProvider(),
      child: Container(
          child: Stack(
        children: [
          PinterestGrid(),
          _PinteresMenuLocation(items: items),
        ],
      )),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {
  final List<PinterestButton> items;

  const _PinteresMenuLocation({Key key, @required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 30,
      child: Container(
        width: size.width,
        child: Align(
          child: PinterestMenu(
            items: items,
            backgroundColor: Colors.grey[800],
            primaryColor: Colors.white,
            secondaryColor: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
