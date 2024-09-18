import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Samples/action_button_sample_screen.dart';
import 'package:provider/provider.dart';
import 'package:untitled/DesignSystem/Components/BottomBar/bottom_bar.dart';
import 'package:untitled/DesignSystem/Components/BottomBar/bottom_bar_view_model.dart';
import 'package:untitled/DesignSystem/Samples/home_page.dart';
import 'package:untitled/DesignSystem/Samples/notifications_page.dart';
import 'package:untitled/DesignSystem/Samples/profile_page.dart';
import 'package:untitled/DesignSystem/Samples/search_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomBarViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(
        pages: [
          HomePage(),
          SearchPage(),
          NotificationsPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}