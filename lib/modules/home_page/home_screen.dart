import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var ctrl = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (_) => ListView.builder(
          itemCount: ctrl.userDetail.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.toNamed("/detailScreen", arguments: ctrl.userDetail[index].id);
              },
              child: Card(
                child: Column(
                  children: [
                    Text(ctrl.userDetail[index].userId.toString()),
                    Text(ctrl.userDetail[index].id.toString()),
                    Text(ctrl.userDetail[index].title.toString()),
                    Text(ctrl.userDetail[index].completed.toString()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _drawer() {
    return Drawer(
      child: GetBuilder<HomeScreenController>(
        builder: (_) => ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 100,
                    ),
                    ctrl.user!.email.isEmpty
                        ? Container()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(ctrl.user!.firstName),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(ctrl.user!.lastName),
                                ],
                              ),
                              Text(ctrl.user!.email),
                            ],
                          ),
                  ],
                )),
            ListTile(
              title: const Text('update profile'),
              onTap: () {
                ctrl.updateProfileButton();
              },
            ),
            ListTile(
              title: const Text('NewPassword'),
              onTap: () {
                ctrl.updatePasswordButton();
              },
            ),
            ListTile(
              title: const Text('LogOut'),
              onTap: () {
                ctrl.alartDialog();

                // Get.offNamed("/loginScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
