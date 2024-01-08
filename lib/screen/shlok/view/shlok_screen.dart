import 'package:bhagavatgeeta_api/screen/home/model/home_model.dart';
import 'package:bhagavatgeeta_api/screen/shlok/model/shlok_model.dart';
import 'package:bhagavatgeeta_api/screen/shlok/provider/shlok_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class ShlokScreen extends StatefulWidget {
  const ShlokScreen({super.key});

  @override
  State<ShlokScreen> createState() => _ShlokScreenState();
}

class _ShlokScreenState extends State<ShlokScreen> {
  ShlokProvider? providerr;
  ShlokProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<ShlokProvider>().getShlokData();
  }

  @override
  Widget build(BuildContext context) {
    HomeModel g1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    providerr = context.read<ShlokProvider>();
    providerw = context.watch<ShlokProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            " CHAPTER ${g1.id}",
            style: TextStyle(fontSize: 22, color: orange),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: orange,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Shlok",
                    style: TextStyle(fontSize: 20, color: orange),
                  ),
                ],
              ),
              Text("${providerr!.shlokModel!.text}"),
              Expanded(
                child: ListView.builder(
                  itemCount: providerw!.shlokModel!.translationsList!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "${providerr!.shlokModel!.translationsList![index].description}",
                        style: const TextStyle(fontSize: 17),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
