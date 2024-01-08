import 'package:bhagavatgeeta_api/screen/home/provider/home_provider.dart';
import 'package:bhagavatgeeta_api/screen/shlok/provider/shlok_provider.dart';
import 'package:bhagavatgeeta_api/utils/app_routes.dart';
import 'package:bhagavatgeeta_api/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => ShlokProvider(),),
      ],
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            value.changeTheme();
            return  MaterialApp(
              theme: value.islight?lightTheme:darkTheme,
              debugShowCheckedModeBanner: false,
              routes: appRoutes,);
          },

        )
    ),
  );
}
