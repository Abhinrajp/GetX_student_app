import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_studentapp/model/model.dart';
import 'package:hive_flutter/adapters.dart';

class Studentcontroller extends GetxController {
  RxString boxname = 'studentbox'.obs;
  RxInt index = 0.obs;
  RxString imgPath = ''.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    getallstudents();
  }

  Rx<File?> image = Rx<File?>(null);
  var nameControll = TextEditingController();
  final ageControll = TextEditingController();
  final placeControll = TextEditingController();
  final admControll = TextEditingController();

  RxList<Studentmodel> studentlist = <Studentmodel>[].obs;

  addstudent(Studentmodel student) async {
    final studentbox = await Hive.openBox<Studentmodel>('studentbox');
    studentbox.put(student.id, student);
    await getallstudents();
  }

  getallstudents() async {
    final studentbox = await Hive.openBox<Studentmodel>('studentbox');
    studentlist.clear();
    studentlist.addAll(studentbox.values);
    log(studentlist.toString());
  }

  deletestudent(int id) async {
    final studentbox = await Hive.openBox<Studentmodel>('studentbox');
    await studentbox.deleteAt(id);
    await getallstudents();
  }

  updatestudent(int intex, Studentmodel student) async {
    final studentbox = await Hive.openBox<Studentmodel>('studentbox');
    await studentbox.putAt(intex, student);
    await getallstudents();
  }
}
