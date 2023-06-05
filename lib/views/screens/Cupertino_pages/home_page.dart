import 'package:cupertino_app/views/screens/Cupertino_pages/c_call_page.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/c_chat_page.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/c_home_page_1.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/c_setting_page.dart';
import 'package:flutter/cupertino.dart';


class c_home_page extends StatefulWidget {
  const c_home_page({Key? key}) : super(key: key);

  @override
  State<c_home_page> createState() => _c_home_pageState();
}

class _c_home_pageState extends State<c_home_page> {
  List<Widget> pages = [
     const c_home_page_1(),
     const c_chat_page(),
     const c_call_page(),
     const c_setting_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
         items: const [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble), label: "Chat"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone), label: "Call"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), label: "Setting"),
      ]),
      tabBuilder: (context, index) => CupertinoTabView(builder: (BuildContext context) {
        return pages[index];
      }),
    );
  }
}
