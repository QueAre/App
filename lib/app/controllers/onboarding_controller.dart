import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';






class OnBoardingController extends GetxController{
  final box = GetStorage();
  bool get isShowed => box.read('showed') ?? false;
  void changeShowed(bool val) => box.write('showed', val);
}