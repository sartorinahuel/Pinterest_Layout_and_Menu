import 'package:flutter/material.dart';
import 'package:pinterest_layout/Widgets/pinterest_grid.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final List<PinterestButton> items;

  PinterestMenu({
    Key key,
    this.backgroundColor = Colors.white,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueGrey,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool mostrar;
    mostrar = Provider.of<MenuProvider>(context).mostrar;

    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Builder(
        builder: (context) {
          Provider.of<_MenuModel>(context, listen: false).setPrimaryColor =
              primaryColor;
          Provider.of<_MenuModel>(context, listen: false).setSecondaryColor =
              secondaryColor;
          return AnimatedOpacity(
            opacity: (mostrar) ? 1.0 : 0.0,
            duration: Duration(
              milliseconds: 250,
            ),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 15, spreadRadius: -3)
                ],
              ),
              child: _MenuItems(
                items: items,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems({
    Key key,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        items.length,
        (index) => _PinterestMenuButton(
          index: index,
          item: items[index],
        ),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({
    Key key,
    this.index,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ssMenuModel = Provider.of<_MenuModel>(context);
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).setItemSeleccionado =
              index;
          item.onPressed();
        },
        child: Icon(
          item.icon,
          size: (ssMenuModel.itemSeleccionado == index) ? 32 : 25,
          color: (ssMenuModel.itemSeleccionado == index) ? ssMenuModel.primaryColor : ssMenuModel.secondaryColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _indexSeleccionado = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.blueGrey;

  int get itemSeleccionado => this._indexSeleccionado;
  Color get primaryColor => this._primaryColor;
  Color get secondaryColor => this._secondaryColor;

  set setItemSeleccionado(int index) {
    _indexSeleccionado = index;
    notifyListeners();
  }

  set setPrimaryColor(Color index) {
    _primaryColor = index;
    // notifyListeners();
  }

  set setSecondaryColor(Color index) {
    _secondaryColor = index;
    // notifyListeners();
  }
}
