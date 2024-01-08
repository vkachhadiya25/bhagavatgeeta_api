import 'package:bhagavatgeeta_api/screen/shlok/model/shlok_model.dart';
import 'package:bhagavatgeeta_api/utils/api_helper.dart';
import 'package:flutter/foundation.dart';


class ShlokProvider with ChangeNotifier
{
  ShlokModel? shlokModel;

  Future<void> getShlokData()
  async {
    JsonHelper jsonHelper =JsonHelper();
    ShlokModel? h1  = await jsonHelper.shlokAPICall();
    shlokModel = h1;
    notifyListeners();
  }
}