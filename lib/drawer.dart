import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'UniColab',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: () {
              // Navigate to Friends screen
              Navigator.pushNamed(context, 'Freind1');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Market'),
            onTap: () {
              // Navigate to Market screen
              Navigator.pushNamed(context, "Market1");
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Career Hub'),
            onTap: () {
              // Navigate to Career Hub screen
              Navigator.pushNamed(context, 'Career1');
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Lectures'),
            onTap: () {
              // Navigate to Lectures screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Resources'),
            onTap: () {
              // Navigate to Resources screen
              Navigator.pushNamed(context, 'Resources1');
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Communities'),
            onTap: () {
              // Navigate to Communities screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.videogame_asset), // Gaming icon
            title: Text('Games'),
            onTap: () {
              // Navigate to Games screen
              Navigator.pushNamed(context, 'Game1');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings screen
              Navigator.pushNamed(context, 'Communities1');
            },
          ),
        ],
      ),
    );
  }
}
