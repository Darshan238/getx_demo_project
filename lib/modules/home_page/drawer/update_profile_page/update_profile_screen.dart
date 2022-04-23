import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_demo/modules/home_page/drawer/update_profile_page/update_profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);
   final _formKey = GlobalKey<FormState>();
   var ctrl=Get.put(UpdateProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('UpdateProfile')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter text ';
                      }
                    },
                    controller: ctrl.firstNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'firstname',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter text ';
                      }
                      return null;
                    },
                    // obscureText: true,
                    controller: ctrl.lastNAmeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'lastname',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter the email';
                      }
                      // else if(value == ctrl.updateProfile.email){
                      //   return'current user';
                      // }
                    },
                    // obscureText: true,
                    controller: ctrl.emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ),
                    onPressed: ()  {
                      if (_formKey.currentState!.validate()) {
                        ctrl.updateProfileButton();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
