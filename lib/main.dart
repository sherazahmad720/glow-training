import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:training/views/common_view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  //     );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* -------------------------------------------------------------------------- */
  /*                This widget is the root of your application.                */
  /* -------------------------------------------------------------------------- */
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            //useInheritedMediaQuery: true,// Set to true
            //locale: DevicePreview.locale(context), // Add the locale here
            title: 'Glow Pupil',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
            ),
            home: SplashScreen()));
  }
}
