import 'package:cash_flow_journal/helper/state_helper.dart';
import 'package:cash_flow_journal/provider/preference_provider.dart';
import 'package:cash_flow_journal/ui/home_page.dart';
import 'package:cash_flow_journal/ui/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageRouter extends StatelessWidget {
  static const routename = '/page_router';
  const PageRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (BuildContext context, data, child) {
        if (data.state == ResultState.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (data.state == ResultState.hasData) {
          return const HomePage();
        } else {
          return const WelcomePage();
        }
      },
    );
  }
}
