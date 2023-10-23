import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/_main_dashboard_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/splash.dart';
import 'package:gameindiamatka/utils/core/app_theme.dart';
import 'package:gameindiamatka/ztest.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('user_id');
  runApp(MyApp(email: email));
}

class MyApp extends StatelessWidget {
  String? email;
   MyApp({Key? key,  this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          home: child,
        );
      },
     // child: MyDatePicker(),
      child: email == null ? SplashScreen() : MainDashboardScreen()
    );
  }
}

