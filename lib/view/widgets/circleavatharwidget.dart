import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:getx_studentapp/controller/addstudentfunction.dart';
import 'package:getx_studentapp/controller/studentcontroller.dart';
import 'package:image_picker/image_picker.dart';

class Fromcircleavathar extends StatelessWidget {
  const Fromcircleavathar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Studentcontroller>();
    // final functionscontroller = Get.find<Addstudent>();
    return Obx(() => Column(
          children: [
            controller.image.value != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(controller.image.value!),
                  )
                : const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("lib/asset/user-not-found.png"),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 80,
              ),
              child: IconButton(
                  color: const Color.fromARGB(255, 146, 145, 145),
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    var image1 =
                        await picker.pickImage(source: ImageSource.gallery);
                    controller.image.value = File(image1!.path);
                  },
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 40,
                  )),
            ),
          ],
        ));
  }
}
