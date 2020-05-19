import 'dart:async';

import 'package:flutter/material.dart';

enum ViewState { LOADING, IDLE }

abstract class BaseViewModel with ChangeNotifier {
  var _streamController = StreamController<ViewState>();

  get viewStateStream => _streamController.stream;

  void setViewState(ViewState state) {
    _streamController.sink.add(state);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
