import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController full_name_controller = TextEditingController();
TextEditingController phone_number_controller = TextEditingController();
TextEditingController chat_conversation_controller = TextEditingController();


String? full_name;
int? phone_number;
String? chat_conversation;

File? imgfile;
ImagePicker picker = ImagePicker();
String? path;


class Global{
    static List<all_information> add_information = [];
}
class all_information{
    String name;
    int phone;
    String chat;
    // String date;
    // String time;
    File img;
    all_information({
        required this.name,
        required this.phone,
        required this.chat,
        required this.img,
        // required this.date,
        // required this.time,
    });
}