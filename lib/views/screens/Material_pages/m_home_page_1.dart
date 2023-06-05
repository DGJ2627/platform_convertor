import 'dart:io';
import 'package:cupertino_app/Model/Global_Variable.dart';
import 'package:cupertino_app/Provider/Platform_Convertor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class m_home_page_1 extends StatefulWidget {
  const m_home_page_1({Key? key}) : super(key: key);

  @override
  State<m_home_page_1> createState() => _m_home_page_1State();
}

class _m_home_page_1State extends State<m_home_page_1> {
  GlobalKey<FormState> add_contact_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),

          //image
          Expanded(
            flex: 1,
            child: GestureDetector(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // camera
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    XFile? image = await picker.pickImage(
                                        source: ImageSource.camera);
                                    Provider.of<Plat_form_convertor>(context,
                                            listen: false)
                                        .change_img_camera(File(image!.path));
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
                                    Provider.of<Plat_form_convertor>(context,
                                            listen: false)
                                        .change_img_camera(File(image!.path));
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
                radius: 200,
                foregroundImage:
                    (imgfile != null) ? FileImage(imgfile as File) : null,
                child: const Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),

          // text form field
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: add_contact_key,

                  // full name
                  child: Column(
                    children: [
                      // full name
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Name";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          full_name = val;
                        },
                        controller: full_name_controller,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full Name",
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // phone number
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Phone Number";
                          }
                          else if (val.length != 10) {
                            return "Enter Minimum 10 Digit Number";
                          }
                          return null;
                        },

                        onSaved: (val) {
                          phone_number = int.parse(val!);
                        },
                        controller: phone_number_controller,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.call),
                          hintText: "Phone Number",
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // chat conversation
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter chat Conversation";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          chat_conversation = val;
                        },
                        controller: chat_conversation_controller,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.chat_outlined),
                          hintText: "Chat Conversation",
                        ),
                      ),
                    ],
                  )),
            ),
          ),

          // Date and Time

          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () async {
                        DateTime? pick_date = await showDatePicker(
                          context: context,
                          initialDate: Provider.of<Plat_form_convertor>(context,
                                  listen: false)
                              .current_date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        );
                        Provider.of<Plat_form_convertor>(context, listen: false)
                            .pickdate(pick_date!);
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                    Text(
                      "${Provider.of<Plat_form_convertor>(context, listen: true).current_date.day.toString()}/"
                      "${Provider.of<Plat_form_convertor>(context, listen: true).current_date.month.toString()}/"
                      "${Provider.of<Plat_form_convertor>(context, listen: true).current_date.year.toString()}",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () async {
                        TimeOfDay? pick_time = await showTimePicker(
                          context: context,
                          initialTime: Provider.of<Plat_form_convertor>(context,
                                  listen: false)
                              .Time_now,
                        );
                        Provider.of<Plat_form_convertor>(context, listen: false)
                            .pickTime(pick_time!);
                      },
                      icon: const Icon(Icons.access_time_sharp),
                    ),
                    Text(
                        "${Provider.of<Plat_form_convertor>(context, listen: true).Time_now.hour} : "
                        "${Provider.of<Plat_form_convertor>(context, listen: true).Time_now.minute}"),
                  ],
                ),
              ],
            ),
          ),

          // save btn
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                if (add_contact_key.currentState!.validate()) {
                  add_contact_key.currentState!.save();
                  all_information a1 = all_information(
                      name: full_name!,
                      phone: phone_number!,
                      chat: chat_conversation!,
                      img: imgfile!,
                      // date: Provider.of<Plat_form_convertor>(context).current_date.toString(),
                      // time: Provider.of<Plat_form_convertor>(context).Time_now.toString(),
                  );
                  Global.add_information.add(a1);

                }
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
