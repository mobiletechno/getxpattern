import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_config/app_constant.dart';

import 'package:get/get.dart';

import 'app_config/approutes.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConstant.MOBILEHEIGHT = MediaQuery.of(context).size.height;
    AppConstant.MOBILEWIDTH = MediaQuery.of(context).size.width;
    AppConstant.RESPONSIVEHEIGHT =
        AppConstant.MOBILEHEIGHT * 0.01;
    AppConstant.RESPONSIVEWIDTH =
        AppConstant.MOBILEWIDTH * 0.01;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Approutes.list,
      initialRoute: AppConstant.HOME_NAME,
    );
  }
}
