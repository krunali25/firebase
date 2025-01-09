import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_features/screen/firebase_messaging_service.dart';
import 'package:firebase_features/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'helper/app_assets.dart';
import 'helper/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessagingService().init();// Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GoRouter? _appRouter;

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    _appRouter ??= appRouter();
    return ScreenUtilInit(
        designSize: Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: StringConstants.appName,
          routeInformationProvider: _appRouter!.routeInformationProvider,
          routeInformationParser: _appRouter!.routeInformationParser,
          routerDelegate: _appRouter!.routerDelegate,
        ),

    );
  }
}
