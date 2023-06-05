import 'dart:io';
import 'package:flutter/material.dart';
import '../../../Model/Global_Variable.dart';
import 'package:url_launcher/url_launcher.dart';


class m_call_page extends StatefulWidget {
  const m_call_page({Key? key}) : super(key: key);

  @override
  State<m_call_page> createState() => _m_call_pageState();
}

class _m_call_pageState extends State<m_call_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Global.add_information.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  foregroundImage:
                      FileImage(Global.add_information[index].img as File),
                ),
                title: Text(Global.add_information[index].name),
                subtitle: Text("+91 ${Global.add_information[index].phone.toString()}"),
                trailing: IconButton(
                  onPressed: () async{
                    Uri url = Uri.parse("tel: +91 ${Global.add_information[index].phone}");
                    await launchUrl(url);
                  },
                  icon: const Icon(Icons.call),
                ),
              ),
              itemCount: Global.add_information.length,
            )
          : const Center(
              child: Text("No Contact",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
    );
  }
}
