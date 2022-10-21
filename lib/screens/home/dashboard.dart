import 'package:bitchat/screens/home/calls.dart';
import 'package:bitchat/screens/home/chats.dart';
import 'package:bitchat/screens/home/people.dart';
import 'package:bitchat/screens/home/settings.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  var screens = const [Chats(), Calls(), People(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
            label: "Chats", icon: Icon(CupertinoIcons.chat_bubble_2)),
        BottomNavigationBarItem(
            label: "Calls", icon: Icon(CupertinoIcons.phone)),
        BottomNavigationBarItem(
            label: "People", icon: Icon(CupertinoIcons.person_alt_circle)),
        BottomNavigationBarItem(
            label: "Settings", icon: Icon(CupertinoIcons.settings_solid)),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return screens[index];

        // Container(
        //   child: Center(
        //     child: Text("$index"),
        //   ),
        // );
      },
    ));
  }
}
