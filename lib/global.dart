import 'package:flutter/cupertino.dart';
import 'package:mobile_advanced_project_fe/core/service/storage_service.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

import 'init_dependencies.main.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
    await initDependencies();
    await LocalNotifications.init();
  }
}
