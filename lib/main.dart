import 'package:cash_flow_journal/constant/colors.dart';
import 'package:cash_flow_journal/helper/page_router_helper.dart';
import 'package:cash_flow_journal/provider/preference_provider.dart';
import 'package:cash_flow_journal/provider/statistic_provider.dart';
import 'package:cash_flow_journal/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/preference_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => StatisticProvider()),
      ],
      child: MaterialApp(
        title: 'Cash Flow Journal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: backgroundColor,
        ),
        initialRoute: PageRouter.routename,
        routes: {
          PageRouter.routename: (context) => const PageRouter(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
