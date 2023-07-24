import 'package:flutter/cupertino.dart';

class NavigationIndexModel extends ChangeNotifier{
  int index = 0;
  String route = '';

  resetRoute({String route = ''}){
    this.route = route;
    notifyListeners();
  }

  resetIndex(int index){
    this.index = index;
    route = '';
    notifyListeners();
  }

  NavigationIndexModel();
}
