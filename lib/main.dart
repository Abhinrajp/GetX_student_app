import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_studentapp/model/model.dart';
import 'package:getx_studentapp/view/formscreen.dart';
import 'package:getx_studentapp/view/homescreen.dart';
import 'package:getx_studentapp/view/profilescreen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentmodelAdapter().typeId)) {
    Hive.registerAdapter(StudentmodelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Student app',
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
