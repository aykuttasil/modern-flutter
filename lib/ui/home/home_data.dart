import 'package:modern_flutter/ui/base/base_data.dart';

class HomeData extends BaseData {
  String name = "Aykut Asil";

  void changeName() {
    if (name == "Aykut Asil") {
      name = "Name is changed.";
    } else {
      name = "Aykut Asil";
    }

    setViewState(ViewState.LOADING);
    Future.delayed(Duration(seconds: 3)).then((_) {
      setViewState(ViewState.IDLE);
      // notifyListeners();
    });
  }
}
