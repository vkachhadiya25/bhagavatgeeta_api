import 'package:bhagavatgeeta_api/screen/home/model/home_model.dart';
import 'package:bhagavatgeeta_api/screen/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class AadhyaScreen extends StatefulWidget {
  const AadhyaScreen({super.key});

  @override
  State<AadhyaScreen> createState() => _AadhyaScreenState();
}

class _AadhyaScreenState extends State<AadhyaScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;
  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    HomeModel g1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            " CHAPTER ${g1.id}",
            style: TextStyle(fontSize: 22, color: orange),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                providerw!.language == "English"
                    ? Text(
                  "${g1.name_translated}",
                  style: TextStyle(fontSize: 22, color: orange),
                )
                    : Text(
                  "${g1.name_meaning}",
                  style: TextStyle(fontSize: 22, color: orange),
                ),
                const SizedBox(height: 5,),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(
                      Icons.menu_book,
                      color: orange,
                    )),
                const SizedBox(
                  height: 5,
                ),
                providerw!.language == "English"
                    ? Text(
                  "${g1.chapter_summary}",
                  style: TextStyle(fontSize: 18, color: black),
                )
                    : Text(
                  "${g1.chapter_summary_hindi}",
                  style: TextStyle(fontSize: 18, color: black),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, 'shlok',arguments: g1);
                }, child: const Text("Read the Shlok",style: TextStyle(fontSize: 19),),),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: providerr!.islight ? black : white,
                size: 25,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.share_rounded,
                color: providerr!.islight ? black : white,
                size: 25,
              ),
              label: "Share",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
                color: providerr!.islight ? black : white,
                size: 25,
              ),
              label: "Edit",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                color: providerr!.islight ? black : white,
                size: 25,
              ),
              label: "BookMark",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.save,
                color: providerr!.islight ? black : white,
                size: 25,
              ),
              label: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
