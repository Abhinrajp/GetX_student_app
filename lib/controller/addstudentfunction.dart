import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_studentapp/controller/studentcontroller.dart';
import 'package:getx_studentapp/model/model.dart';

class Addstudent extends GetxController {
  final controller = Get.find<Studentcontroller>();
  RxBool isupdate = false.obs;
  addStudButt() async {
    final aname = controller.nameControll.text.trim();
    final aage = controller.ageControll.text.trim();
    final aplace = controller.placeControll.text.trim();
    final aaddNO = controller.admControll.text.trim();
    final aimage = controller.image.value!.path;
    final student = Studentmodel(
      name: aname,
      age: aage,
      addNO: aaddNO,
      place: aplace,
      id: DateTime.now().toString(),
      image: aimage,
    );
    isupdate.value
        ? await controller.updatestudent(controller.index.value, student)
        : await controller.addstudent(student);
    Get.back();
  }

  resetdata() {
    controller.nameControll.text = '';
    controller.ageControll.text = '';
    controller.placeControll.text = '';
    controller.admControll.text = '';
    controller.image = Rx<File?>(null);
    isupdate.value = false;
  }

  editsetdata(int index) {
    controller.nameControll.text = controller.studentlist[index].name;
    controller.ageControll.text = controller.studentlist[index].age;
    controller.placeControll.text = controller.studentlist[index].place;
    controller.admControll.text = controller.studentlist[index].addNO;
    controller.image.value = File(controller.studentlist[index].image);
  }
}
