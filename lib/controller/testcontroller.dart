
import 'package:get/get.dart';

import '../Data/datasource/remote/test_data.dart';
import '../core/class/status_response.dart';
import '../core/functions/handle_res.dart';

class TestController extends GetxController {
  TestData test = TestData(Get.find());

  List data = [];
  late StatusResponse status;

  getdata() async {
    status = StatusResponse.loading;
    var response = await test.getdata();
    status = handle_Res(response);
    if (status == StatusResponse.success) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
        }else{
          status = StatusResponse.failure;
        }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
