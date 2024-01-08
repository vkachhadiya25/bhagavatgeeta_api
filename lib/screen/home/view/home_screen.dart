import 'package:bhagavatgeeta_api/screen/home/model/home_model.dart';
import 'package:bhagavatgeeta_api/screen/home/provider/home_provider.dart';
import 'package:bhagavatgeeta_api/utils/share_helper.dart';
import 'package:bhagavatgeeta_api/utils/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().gitaGetData();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bhagavad Gita",
            style: TextStyle(fontSize: 25, color: black),
          ),
          backgroundColor: white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 25,
                color: orange,
              ),
            ),
            IconButton(
              onPressed: () {
                alertDialog(context);
              },
              icon: Icon(
                Icons.menu,
                size: 25,
                color: orange,
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, value1, child) => Switch(
                value: providerr!.islight,
                onChanged: (value) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value);
                  providerr!.changeTheme();
                },
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  HomeModel g1 = providerr!.gitaList![index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'aadhya', arguments: g1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.fromBorderSide(
                          BorderSide(color: grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${providerr!.gitaList![index].id}",
                                  style: TextStyle(color: orange, fontSize: 22),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: providerr!.language == "English"
                                      ? Text(
                                          "${providerr!.gitaList![index].name_translated}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 20,
                                          ),
                                        )
                                      : Text(
                                          "${providerr!.gitaList![index].slug}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 20,
                                          ),
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                const Icon(Icons.menu),
                                Text(
                                  "${providerr!.gitaList![index].verses_count} verses",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: providerr!.gitaList!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
