import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskapp39/view/page/home_page.dart';
import 'package:taskapp39/view/page/home_screen.dart';

import 'controller/data/local/datahelper.dart';
import 'controller/data/local/shared.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  // await DataHelper.createDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Sizer(
        builder: (context, orientation, deviceType) {
      return  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );},
    );
  }
}