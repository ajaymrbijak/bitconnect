import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: (SliverChildListDelegate([
          const CupertinoListTile(
            title: Text("Calls"),
          )
        ])))
      ],
    );
  }
}
