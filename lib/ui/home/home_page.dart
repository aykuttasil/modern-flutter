import 'package:flutter/material.dart';
import 'package:modern_flutter/common/locator.dart';
import 'package:modern_flutter/common/logger.dart';
import 'package:modern_flutter/ui/app_data.dart';
import 'package:modern_flutter/ui/about/about_page.dart';
import 'package:modern_flutter/ui/base/base_page.dart';
import 'package:modern_flutter/ui/base/base_data.dart';
import 'package:modern_flutter/ui/home/home_data.dart';
import 'package:provider/provider.dart';

class HomePage extends BasePage {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    logger.d("HomePage build.");

    return ChangeNotifierProvider(
      create: (context) => locator<HomeData>(),
      child: Consumer<HomeData>(
        builder: (context, homeData, child) {
          return StreamBuilder<ViewState>(
            stream: homeData.viewStateStream,
            builder: (context, snapshot) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Modern Flutter"),
                ),
                body: Container(
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder: (context, _) {
                      if (snapshot.data == ViewState.LOADING) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(context.read<AppData>().isDarkTheme
                              ? "isDark"
                              : "isLight"),
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
                              homeData.changeName();
                            },
                          ),
                          Text(homeData.name)
                        ],
                      );
                    },
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.forward),
                  onPressed: () {
                    context.read<AppData>().changeAppTheme();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
