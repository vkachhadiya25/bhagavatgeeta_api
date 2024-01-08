import 'package:bhagavatgeeta_api/screen/adhya/view/adhya_screen.dart';
import 'package:bhagavatgeeta_api/screen/home/view/home_screen.dart';
import 'package:bhagavatgeeta_api/screen/shlok/view/shlok_screen.dart';
import 'package:bhagavatgeeta_api/screen/splesh/view/splesh_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String,WidgetBuilder> appRoutes =
{
  '/' : (context) => const SpleshScreen(),
  'home' : (context) =>  const HomeScreen(),
  'aadhya' : (context) =>  const AadhyaScreen(),
  'shlok' : (context) =>  const ShlokScreen(),
};