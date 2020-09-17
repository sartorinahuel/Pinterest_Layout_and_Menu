import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<String> items = [
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper1.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper2.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper3.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper4.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper5.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper6.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper7.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper8.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper9.jpg",
    "https://tecnologia21.com/wp-content/uploads/2011/04/wallpaper10.jpg",
  ];
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      // print(controller.offset);
      if (controller.offset > scrollAnterior) {
        Provider.of<MenuProvider>(context, listen: false).setMostrar = false;
      } else {
        Provider.of<MenuProvider>(context, listen: false).setMostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: 4,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem(
          index: items[index],
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final String index;

  const _PinterestItem({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
                      child: Container(
              // margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  index,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "...  ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuProvider with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set setMostrar(bool m) {
    _mostrar = m;
    notifyListeners();
  }
}
