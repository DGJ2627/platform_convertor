import 'dart:io';

import 'package:cupertino_app/Provider/Platform_Convertor.dart';
import 'package:cupertino_app/Provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Model/Global_Variable.dart';

class m_setting_page extends StatefulWidget {
  const m_setting_page({Key? key}) : super(key: key);

  @override
  State<m_setting_page> createState() => _m_setting_pageState();
}

class _m_setting_pageState extends State<m_setting_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: 50,
                ),
                const Column(
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Update your profile"),
                  ],
                ),
                const SizedBox(
                  width: 80,
                ),
                Switch(
                    value: Provider.of<Plat_form_convertor>(context).profile,
                    onChanged: (val) {
                      Provider.of<Plat_form_convertor>(context, listen: false)
                          .change_profile(val);
                    }),
                (Provider.of<Plat_form_convertor>(context).profile)
                    ? Container(
                        height: 100,
                        decoration: BoxDecoration(border: Border.all()),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          (Provider.of<Plat_form_convertor>(context).profile)
              ? GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              // camera
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      XFile? image = await picker.pickImage(
                                          source: ImageSource.camera);
                                      Provider.of<Plat_form_convertor>(
                                              context,
                                              listen: false)
                                          .change_img_camera(
                                              File(image!.path));
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.flip_camera_ios_outlined,
                                      size: 40,
                                    ),
                                  ),
                                  const Text("Camera"),
                                ],
                              ),

                              //gallery
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      XFile? image = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      Provider.of<Plat_form_convertor>(
                                              context,
                                              listen: false)
                                          .change_img_camera(
                                              File(image!.path));
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.photo_outlined,
                                      size: 40,
                                    ),
                                  ),
                                  const Text("Gallery"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  foregroundImage:
                      (imgfile != null) ? FileImage(imgfile as File) : null,
                  child: const Icon(Icons.camera_alt_outlined),
                ),
              )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.sunny),
                const SizedBox(
                  width: 60,
                ),

                //theme
                const Column(
                  children: [
                    Text(
                      "Theme",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Change Theme"),
                  ],
                ),
                const SizedBox(
                  width: 90,
                ),
                Switch(
                    value:
                        Provider.of<theme_provider>(context).app_theme.isDark,
                    onChanged: (val) {
                      Provider.of<theme_provider>(context, listen: false)
                          .change_app_theme(val);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
