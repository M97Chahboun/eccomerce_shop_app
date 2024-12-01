import 'package:eccomerce_shop_app/consts/api_consts.dart';
import 'package:eccomerce_shop_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

import 'consts/global_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    RocketClient baseRequest = RocketClient(url: "https://$baseUrl/api/v1");
    Rocket.add(key: rocketRequestKey, baseRequest);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 3.0.4 ',
      theme: ThemeData(
        scaffoldBackgroundColor: lightScaffoldColor,
        primaryColor: lightCardColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),
          backgroundColor: lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: lightIconsColor,
        ),

        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,

          // selectionHandleColor: Colors.blue,
        ),

        // textTheme: TextTheme()
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.black,
        //       displayColor: Colors.black,
        //     ),
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(
              secondary: lightIconsColor,
              brightness: Brightness.light,
            )
            .copyWith(surface: lightBackgroundColor),
      ),
      home: const HomeScreen(),
    );
  }
}
