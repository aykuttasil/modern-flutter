import 'package:modern_flutter/ui/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  String name = "Aykut Asil";

  void changeName() {
    if (name == "Aykut Asil") {
      name = "Name is changed.";
    } else {
      name = "Aykut Asil";
    }

    setState(ViewState.LOADING);
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(ViewState.IDLE);
      // notifyListeners();
    });
  }
}
