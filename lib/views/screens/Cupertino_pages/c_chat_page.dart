import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Platform_Convertor.dart';

class c_chat_page extends StatefulWidget {
  const c_chat_page({Key? key}) : super(key: key);

  @override
  State<c_chat_page> createState() => _c_chat_pageState();
}

class _c_chat_pageState extends State<c_chat_page> {
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Platform Convertor ",style: TextStyle(color: CupertinoColors.black),),
        trailing: CupertinoSwitch(
            value: Provider.of<Plat_form_convertor>(context, listen: true).ios,
            onChanged: (val) {
              Provider.of<Plat_form_convertor>(context, listen: false)
                  .Change_platfrom(val);
            }),
      ),
      child: const Center(
          child: Text(
            "Ios 1",
            style: TextStyle(color: CupertinoColors.white, fontSize: 50),
          )),
    );
  }
}
