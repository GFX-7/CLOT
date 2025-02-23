import 'dart:async';

import 'package:clot/core/constants/theme/app_theme.dart';
import 'package:clot/core/utils/hive_service.dart';
import 'package:clot/features/about_yourself/provider/about_yourself_provider.dart';
import 'package:clot/features/address/add_address/provider/add_address_provider.dart';
import 'package:clot/features/card/provider/card_provider.dart';
import 'package:clot/features/home/provider/home_provider.dart';
import 'package:clot/features/main/provider/main_provider.dart';
import 'package:clot/features/notification/provider/notification_provider.dart';
import 'package:clot/features/payment/provider/payment_provider.dart';
import 'package:clot/features/product/provider/product_provider.dart';
import 'package:clot/features/search/provider/search_provider.dart';
import 'package:clot/features/sign_in/provider/sign_in_provider.dart';
import 'package:clot/features/splash/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // * Dastur faqat vertical ishlashini taminlaydi
  WidgetsFlutterBinding();
  await HiveService.createBox();
  await GetStorage.init();
  
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiProvider(
    // ! Dasturdagi barcha providerlar shu yerda tanitilish kerak
    providers: [
      ChangeNotifierProvider(create: (context) => SignInProvider()),
      ChangeNotifierProvider(create: (context) => AboutYourselfProvider()),
      ChangeNotifierProvider(create: (context) => MainProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(create: (context) => NotificationProvider()),
      ChangeNotifierProvider(create: (context) => SearchProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => CardProvider()),
      ChangeNotifierProvider(create: (context) => AddAddressProvider()),
      ChangeNotifierProvider(create: (context) => PaymentProvider()),
    ],
    child: const ClotApp(),
  ));
}

class ClotApp extends StatelessWidget {
  const ClotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clot',
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
