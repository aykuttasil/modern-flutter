import 'package:flutter/material.dart';
import '../../common/locator.dart';
import '../../common/logger.dart';
import '../app_data.dart';
import '../about/about_page.dart';
import '../base/base_page.dart';
import '../base/base_data.dart';
import 'home_data.dart';
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
                body: LayoutBuilder(
                  builder: (context, _) {
                    if (snapshot.data == ViewState.LOADING) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(context.read<AppData>().isDarkTheme
                              ? "isDark"
                              : "isLight"),
                          RaisedButton(
                            child: Text("Press"),
                            onPressed: () => Navigator.pushNamed(
                                context, AboutPage.routeName),
                          ),
                          RaisedButton(
                            child: Text("Change Name"),
                            onPressed: () => homeData.changeName(),
                          ),
                          Text(homeData.name)
                        ],
                      ),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.forward),
                  onPressed: () => context.read<AppData>().changeAppTheme(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
