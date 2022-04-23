import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_screen_controller.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  var ctrl = Get.put(DetailScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DetailScreenController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('DetailPAge'),
        ),
        body: ListView.builder(
            itemCount: ctrl.apiDetail.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    Text(ctrl.apiDetail[index].postId.toString()),
                    Text(ctrl.apiDetail[index].id.toString()),
                    Text(ctrl.apiDetail[index].name.toString()),
                    Text(ctrl.apiDetail[index].email.toString()),
                    Text(ctrl.apiDetail[index].body.toString()),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
