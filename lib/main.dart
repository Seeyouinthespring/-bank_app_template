import 'package:bank_app_template/models/navigation_index_model.dart';
import 'package:bank_app_template/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationIndexModel>(create: (context) => NavigationIndexModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: CustomNavigation(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
