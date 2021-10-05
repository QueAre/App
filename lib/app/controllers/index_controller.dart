import 'package:get/get.dart';

class IndexController extends GetxController {
  RxInt index = 0.obs;

  changeIndex(index) {
    index.value = index;
  }
}
