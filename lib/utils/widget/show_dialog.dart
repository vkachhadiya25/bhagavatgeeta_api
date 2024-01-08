import 'package:bhagavatgeeta_api/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void alertDialog (BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Languages"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                value: "English",
                groupValue: context.read<HomeProvider>().language,
                title: const Text("English"),
                onChanged: (value) {
                  context.read<HomeProvider>().setLanguage(value.toString());

                },
              ),
              RadioListTile(
                value: "Hindi",
                groupValue: context.read<HomeProvider>().language,
                onChanged: (value) {
                  context.read<HomeProvider>().setLanguage(value.toString());
                },
                title: const Text("Hindi"),
              ),
            ],
          ),
        );
      });
}