import 'package:get/get.dart';
import 'package:mobile_to_do_planner/db/db_helper.dart';
import 'package:mobile_to_do_planner/models/task.dart';

class GorevDenetleyicisi extends GetxController {
  @override
  void hazir() {
    super.onReady();
  }

  static Future<int> GorevEkle({Task? task}) async {
    return await DBYardimci.insert(task);
  }
}
