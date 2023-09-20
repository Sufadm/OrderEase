import 'package:flutter/material.dart';
import 'package:inexoft/view/screens/form_page.dart';
import 'package:inexoft/view/screens/homepage.dart';
import 'package:inexoft/view/screens/profilepage.dart';

class BottomNavState extends ChangeNotifier {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ProfilePage()
  ];

  int get selectedIndex => _selectedIndex;
  List<Widget> get widgetOptions => _widgetOptions;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
