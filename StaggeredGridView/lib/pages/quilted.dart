import 'package:flutter/widgets.dart';

import '../common.dart';
import '../staggered_grid_view/src/layouts/quilted.dart';

class QuiltedPage extends StatelessWidget {
  const QuiltedPage({
    Key? key,
  }) : super(key: key);

  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Quilted',
      child: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: pattern,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            final tile = pattern[index % pattern.length];
            return ImageTile(
              index: index,
              width: tile.crossAxisCount * 100,
              height: tile.mainAxisCount * 100,
            );
          },
        ),
      ),
    );
  }
}
