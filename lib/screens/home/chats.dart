import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';

import 'package:flutter/cupertino.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("chats").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something Went Wrong"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading"),
            );
          } else if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                const CupertinoSliverNavigationBar(
                  largeTitle: Text("Chats"),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return CupertinoListTile(
                        title: Text(data['title']),
                      );
                    }).toList(),
                  ),
                )
              ],
            );
          }
          return Container();
        });

    // CustomScrollView(
    //   slivers: [
    //     const CupertinoSliverNavigationBar(
    //       largeTitle: Text("Chats"),
    //     ),
    //     SliverList(
    //         delegate: (SliverChildListDelegate(const [
    //       CupertinoListTile(
    //         title: Text("Chat1"),
    //       ),
    //       CupertinoListTile(
    //         title: Text("Chat2"),
    //       ),
    //       CupertinoListTile(
    //         title: Text("Chat3"),
    //       ),
    //       CupertinoListTile(
    //         title: Text("Chat4"),
    //       )
    //     ])))
    //   ],
    // );
  }
}
