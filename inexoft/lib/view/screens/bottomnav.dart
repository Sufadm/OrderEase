import 'package:flutter/material.dart';
import 'package:inexoft/controller/bottomnav.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavState>(
      create: (_) => BottomNavState(),
      child: Consumer<BottomNavState>(
        builder: (context, bottomNavState, _) {
          return Scaffold(
            body: Center(
              child: bottomNavState.widgetOptions
                  .elementAt(bottomNavState.selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.values.first,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Profile',
                ),
              ],
              currentIndex: bottomNavState.selectedIndex,
              onTap: (index) {
                bottomNavState.onItemTapped(index);
              },
            ),
          );
        },
      ),
    );
  }
}
