import 'package:flutter/cupertino.dart';
import 'package:mobile_advanced_project_fe/core/service/service_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import 'package:timezone/data/latest.dart' as tz;

import 'init_dependencies.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
    await initDependencies();
    await LocalNotifications.init();
    tz.initializeTimeZones();
  }
}
