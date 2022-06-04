import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  bool isLoading() => loading.value;
  setLoading(val) {
    loading.value = val;
  }
}
