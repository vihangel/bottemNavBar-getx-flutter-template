import 'package:get/instance_manager.dart';
import 'package:cronodoro/pages/dashboard/dashboard_controller.dart';
import 'package:cronodoro/pages/home/home_controller.dart';
import 'package:cronodoro/pages/internal_storage/counter/counter_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
