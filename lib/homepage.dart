import 'package:flutter/material.dart';
import 'package:pinterest_layout/Widgets/pinterest_screen.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _Appbar(),
      ),
      backgroundColor: Colors.black,
      body: PinterestScreen(),
    );
  }
}

class _Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AppbarButton(title: "Para ti", isSelected: true),
        _AppbarButton(title: "Hoy", isSelected: false),
        _AppbarButton(title: "Siguiendo", isSelected: false),
      ],
    );
  }
}

class _AppbarButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _AppbarButton({
    Key key,
    this.title,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: title.length * 5.toDouble() + 45,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}