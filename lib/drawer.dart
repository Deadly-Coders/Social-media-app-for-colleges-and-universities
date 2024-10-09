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
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigate to Friends screen
              Navigator.pushNamed(context, 'Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Friends'),
            onTap: () {
              // Navigate to Friends screen
              Navigator.pushNamed(context, 'Freind1');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Market'),
            onTap: () {
              // Navigate to Market screen
              Navigator.pushNamed(context, "Market");
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Career Hub'),
            onTap: () {
              // Navigate to Career Hub screen
              Navigator.pushNamed(context, 'Career1');
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_settings_outlined),
            title: const Text('AR'),
            onTap: () {
              // Navigate to Lectures screen
              Navigator.pushNamed(context, 'Video');
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat'),
            onTap: () {
              // Navigate to Resources screen
              Navigator.pushNamed(context, 'FriendsChatScreen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Communities'),
            onTap: () {
              // Navigate to Communities screen
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.videogame_asset), // Gaming icon
            title: const Text('Games'),
            onTap: () {
              // Navigate to Games screen
              Navigator.pushNamed(context, 'Game1');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to Settings screen
              Navigator.pushNamed(context, 'Settings');
            },
          ),
        ],
      ),
    );
  }
}
