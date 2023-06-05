import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Platform_Convertor.dart';

class c_home_page_1 extends StatefulWidget {
  const c_home_page_1({Key? key}) : super(key: key);

  @override
  State<c_home_page_1> createState() => _c_home_page_1State();
}

class _c_home_page_1State extends State<c_home_page_1> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Platform Convertor ",
          style: TextStyle(color: CupertinoColors.white),
        ),
        trailing: CupertinoSwitch(
            value: Provider.of<Plat_form_convertor>(context, listen: true).ios,
            onChanged: (val) {
              Provider.of<Plat_form_convertor>(context, listen: false)
                  .Change_platfrom(val);
            }),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    );
  }
}
