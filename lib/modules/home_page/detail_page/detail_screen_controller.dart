
import 'package:get/get.dart';
import 'package:getx_project_demo/local/db.dart';
import 'package:getx_project_demo/model/detail_api.dart';

import '../../../api_g.dart';

class DetailScreenController extends GetxController {
  List<DetailApi> apiDetail = [];

  // late ApiModel ret;

  @override
  void onInit() {
    final id = Get.arguments as int;
    DB().dio();
    DB().apiMethod.getDetailUser(id).then((value) {
      apiDetail = value.cast<DetailApi>();
      update();
    });

    // init();
    // DB();
  }
// init() async {
//
//   final id = Get.arguments as int;
//   // ModalRoute.of(context)!.settings.arguments as ApiModel;
//
//   Uri url = Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$id');
//   http.Response r1 = await http.get(url);
//   // print(r1.bodyBytes);
//   switch (r1.statusCode) {
//     case 200:
//       List resdata = jsonDecode(r1.body);
//       apiDetail = resdata.map((i) => DetailApi.fromJson(i)).toList();
//       // debugPrint(apiDetail.length.toString());
//       update();
//       break;
//   }
// }
}
