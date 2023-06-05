import 'package:cupertino_app/views/screens/Cupertino_pages/c_call_page.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/c_chat_page.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/c_home_page_1.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/c_setting_page.dart';
import 'package:cupertino_app/views/screens/Cupertino_pages/home_page.dart';
import 'package:cupertino_app/views/screens/Material_pages/home_page.dart';
import 'package:cupertino_app/views/screens/Material_pages/m_call_page.dart';
import 'package:cupertino_app/views/screens/Material_pages/m_chat_page.dart';
import 'package:cupertino_app/views/screens/Material_pages/m_home_page_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/theme_model.dart';
import 'Provider/Platform_Convertor.dart';
import 'Provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Plat_form_convertor()),
        ChangeNotifierProvider(
          create: (context) => theme_provider(
            app_theme: theme_model(isDark: false),
          ),
        ),
      ],
      child: Consumer<Plat_form_convertor>(
        builder: (context, value, _) => (value.ios == false)
            ? MaterialApp(
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.light(
                    primary: const Color(0xff37474f),
                    secondary: Colors.grey.shade200,
                  ),
                ),
                darkTheme: ThemeData(
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  useMaterial3: true,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
                  colorScheme: const ColorScheme.dark(
                    brightness: Brightness.dark,
                    primary: Colors.deepPurpleAccent,
                    secondary: Colors.white54,
                  ),
                ),
                themeMode:
                    (Provider.of<theme_provider>(context).app_theme.isDark)
                        ? ThemeMode.dark
                        : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => const m_home_page(),
                  'm_home_page_1': (context) => const m_home_page_1(),
                  'm_chat_page': (context) => const m_chat_page(),
                  'm_call_page': (context) => const m_chat_page(),
                  'm_setting_page': (context) => const m_call_page(),
                },
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => const c_home_page(),
                  'c_home_page_1': (context) => const c_home_page_1(),
                  'c_chat_page': (context) => const c_chat_page(),
                  'c_call_page': (context) => const c_call_page(),
                  'c_setting_page': (context) => const c_setting_page(),
                },
              ),
      ),
    ),
  );
}
