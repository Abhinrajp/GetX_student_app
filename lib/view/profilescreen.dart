import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_studentapp/controller/studentcontroller.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailcontoller = Get.find<Studentcontroller>();
    final data = detailcontoller.studentlist[detailcontoller.index.value];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Student Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Center(
          child: Card(
            elevation: 25,
            color: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              width: 300,
              height: 400,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                      radius: 60, backgroundImage: FileImage(File(data.image))),
                  const SizedBox(
                    height: 20,
                  ),
                  profileData('Name', data.name),
                  const SizedBox(
                    height: 20,
                  ),
                  profileData('Age', data.age),
                  const SizedBox(
                    height: 20,
                  ),
                  profileData('Place', data.place),
                  const SizedBox(
                    height: 20,
                  ),
                  profileData('Add No', data.addNO),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  profileData(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 70,
        ),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            ': $value',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
