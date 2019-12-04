import 'package:modern_flutter/ui/base/BaseViewmodel.dart';

class HomeViewModel extends BaseViewModel {
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
