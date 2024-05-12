import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_studentapp/controller/addstudentfunction.dart';
import 'package:getx_studentapp/controller/studentcontroller.dart';
import 'package:getx_studentapp/view/formscreen.dart';
import 'package:getx_studentapp/view/profilescreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentcontroller = Get.put(Studentcontroller());
    final controller = Get.put(Addstudent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          'Student Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: Obx(() => ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              color: Colors.indigo,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: ListTile(
                  onTap: () {
                    Get.to(const Profilescreen(),
                        transition: Transition.fadeIn,
                        duration: const Duration(seconds: 1));
                    studentcontroller.index.value = index;
                  },
                  leading: CircleAvatar(
                    radius: 34,
                    backgroundImage: FileImage(
                        File(studentcontroller.studentlist[index].image)),
                  ),
                  title: Text(
                    studentcontroller.studentlist[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    studentcontroller.studentlist[index].addNO,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: SizedBox(
                    width: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.isupdate.value = true;
                              controller.editsetdata(index);
                              Get.to(
                                const Formscreen(),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(seconds: 1),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        IconButton(
                            onPressed: () {
                              Get.dialog(
                                  AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text('Are you sure'),
                                    content: const Text(
                                      'Do yu want delete the student ?',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            await studentcontroller
                                                .deletestudent(index);
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ))
                                    ],
                                  ),
                                  transitionCurve: Curves.easeInOutCubic);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 132, 28, 21),
                            )),
                      ],
                    ),
                  )),
            );
          },
          itemCount: studentcontroller.studentlist.length)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Get.to(
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(seconds: 1),
          () => const Formscreen(),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
