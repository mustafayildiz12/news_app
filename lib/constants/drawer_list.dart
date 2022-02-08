import 'package:flutter/material.dart';

import 'change_theme_switch_button.dart';

class DrawerHeaderMenu extends StatelessWidget {
  const DrawerHeaderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
      const    DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/news.png'), fit: BoxFit.cover),
            ),
            child: null,
          ),
         const SizedBox(
            height: 12,
          ),
          ListTile(
            leading: const Icon(
              Icons.menu_book
            ),
            title: Text('Home',
                style: TextStyle(color: Theme.of(context).indicatorColor)),
          ),
          ListTile(
            leading:const Icon(Icons.book),
            title: Text('Categories',
                style: TextStyle(color: Theme.of(context).indicatorColor)),
          ),
          ListTile(
            leading: const Icon(Icons.swap_vert),
            title: Text('Bookmarks',
                style: TextStyle(color: Theme.of(context).indicatorColor)),
          ),
          ListTile(
            leading: const Icon(Icons.flag_outlined),
            title: Text('About App',
                style: TextStyle(color: Theme.of(context).indicatorColor)),
          ),
          ListTile(
            trailing:const ChangeThemeButtonWidget(),
            leading: const Icon(Icons.settings),
            title: Text('Settings',
                style: TextStyle(color: Theme.of(context).indicatorColor)),
          ),
        ],
      ),
    );
  }
}
