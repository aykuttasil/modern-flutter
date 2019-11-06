import 'package:flutter/material.dart';
import 'package:modern_flutter/common/locator.dart';
import 'package:modern_flutter/common/logger.dart';
import 'package:modern_flutter/ui/AppViewModel.dart';
import 'package:modern_flutter/ui/about/AboutPage.dart';
import 'package:modern_flutter/ui/home/HomeViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    logger.d("HomePage build.");
    final appState = Provider.of<AppViewModel>(context, listen: false);

    return ChangeNotifierProvider(
      builder: (_) => locator<HomeViewModel>(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Modern Flutter"),
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(appState.isDarkTheme() ? "isDark" : "isLight"),
                  RaisedButton(
                    color: Colors.white54,
                    child: Text("Press"),
                    onPressed: () {
                      Navigator.pushNamed(context, AboutPage.routeName);
                    },
                  ),
                  RaisedButton(
                    color: Colors.white54,
                    child: Text("Change Name"),
                    onPressed: () {
                      viewModel.changeName();
                    },
                  ),
                  Text(viewModel.name)
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.forward),
              onPressed: () {
                appState.changeAppTheme(!appState.isDarkTheme());
              },
            ),
          );
        },
      ),
    );
  }
}
