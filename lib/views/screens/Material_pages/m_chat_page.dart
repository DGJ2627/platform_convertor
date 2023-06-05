import 'dart:io';

import 'package:flutter/material.dart';

import '../../../Model/Global_Variable.dart';

class m_chat_page extends StatefulWidget {
  const m_chat_page({Key? key}) : super(key: key);

  @override
  State<m_chat_page> createState() => _m_chat_pageState();
}

class _m_chat_pageState extends State<m_chat_page> {
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
                subtitle: Text(Global.add_information[index].chat),
                // trailing: Text(Global.add_information[index].date),
              ),
              itemCount: Global.add_information.length,
            )
          : const Center(
              child: Text("No Contact",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
    );
  }
}
