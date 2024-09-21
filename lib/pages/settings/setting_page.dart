import 'package:flutter/material.dart';
import 'package:social_flutter/app_bar.dart';
import 'package:social_flutter/commonnav.dart';
import 'package:social_flutter/drawer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, 'Settings2');
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Edit Password"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, 'Settings3');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text("Customize"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
