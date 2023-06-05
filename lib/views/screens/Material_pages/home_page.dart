import 'package:cupertino_app/views/screens/Material_pages/m_call_page.dart';
import 'package:cupertino_app/views/screens/Material_pages/m_chat_page.dart';
import 'package:cupertino_app/views/screens/Material_pages/m_home_page_1.dart';
import 'package:cupertino_app/views/screens/Material_pages/m_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/Platform_Convertor.dart';

class m_home_page extends StatefulWidget {
  const m_home_page({Key? key}) : super(key: key);

  @override
  State<m_home_page> createState() => _m_home_pageState();
}

class _m_home_pageState extends State<m_home_page> {
  GlobalKey<ScaffoldState> sacffold_key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: sacffold_key,
        appBar: AppBar(
          title: const Text(
            "Platform Converter",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Switch(
                  value:
                      Provider.of<Plat_form_convertor>(context, listen: true).ios,
                  onChanged: (val) {
                    Provider.of<Plat_form_convertor>(context, listen: false)
                        .Change_platfrom(val);
                  }),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person_add_alt),
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Call",
              ),
              Tab(
                text: "Setting",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            m_home_page_1(),
            m_chat_page(),
            m_call_page(),
            m_setting_page(),
          ],
        )
      ),
    );
  }
}
