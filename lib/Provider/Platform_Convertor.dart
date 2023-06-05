import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Model/Global_Variable.dart';


class Plat_form_convertor extends ChangeNotifier {
  bool ios = false;
  File? img;
  bool profile = false;
  bool theme = false;

  void change_profile (bool n){
    profile = n;
    notifyListeners();
  }

  void change_theme(bool n){
    theme = n;
    notifyListeners();
  }

  void change_img_camera(File n) async{
    imgfile = n;
    notifyListeners();
}



  DateTime current_date = DateTime.now();
  TimeOfDay Time_now = TimeOfDay.now();

  void Change_platfrom(bool n) {
    ios = n;
    notifyListeners();
  }

  void pickdate(DateTime n){
    current_date = n;
    notifyListeners();
  }

  void pickTime(TimeOfDay n){
    Time_now = n;
    notifyListeners();
  }


}
