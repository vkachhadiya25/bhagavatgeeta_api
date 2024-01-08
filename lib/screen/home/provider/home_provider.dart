import 'package:bhagavatgeeta_api/screen/home/model/home_model.dart';
import 'package:bhagavatgeeta_api/utils/api_helper.dart';
import 'package:bhagavatgeeta_api/utils/share_helper.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  List<dynamic>? gitaList = [];
  bool islight = false;
  String? language = "English";


  Future<void> gitaGetData()
  async {
    JsonHelper jsonHelper = JsonHelper();
    List<dynamic>? g1 = await jsonHelper.gitaAPICall();
    gitaList = g1 ;
    notifyListeners();
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    islight = isTheme ?? true;
    notifyListeners();
  }

  void setLanguage(String value) {
    language = value;
    notifyListeners();
  }

}
