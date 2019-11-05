import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  String name = "Aykut Asil";

  void changeName() {
    if (name == "Aykut Asil") {
      name = "Name is changed.";
    } else {
      name = "Aykut Asil";
    }
    notifyListeners();
  }
}
