import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_studentapp/controller/addstudentfunction.dart';
import 'package:getx_studentapp/controller/studentcontroller.dart';
import 'package:getx_studentapp/view/widgets/circleavatharwidget.dart';

class Formscreen extends StatelessWidget {
  const Formscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Studentcontroller>();
    final functionscontroller = Get.find<Addstudent>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              functionscontroller.resetdata();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Enter the details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Fromcircleavathar(),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Enter name'
                            : null,
                        controller: controller.nameControll,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              width: 3.0,
                            ),
                          ),
                          hintText: 'name',
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Enter Age'
                            : null,
                        controller: controller.ageControll,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              width: 1.0,
                            ),
                          ),
                          hintText: 'age',
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Enter Place'
                            : null,
                        controller: controller.placeControll,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Place',
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Enter Addmission number'
                            : null,
                        controller: controller.admControll,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Addmission number',
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate() &&
                              controller.image.value != null) {
                            await functionscontroller.addStudButt();
                            functionscontroller.resetdata();
                            Get.snackbar('Sucess', 'Student added successfully',
                                animationDuration: const Duration(seconds: 3),
                                backgroundColor: Colors.white,
                                titleText: const Text(
                                  'Sucess',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                messageText: const Text(
                                  'Student added successfully',
                                  textAlign: TextAlign.center,
                                ));
                          } else if (controller.image.value == null) {
                            Get.snackbar(
                              'Add image',
                              'Image not added',
                              animationDuration: const Duration(seconds: 3),
                              backgroundColor: Colors.white,
                              titleText: const Text(
                                'Add image',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              messageText: const Text(
                                'Image not added',
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
