import 'package:flutter/material.dart';

class Notification1 extends StatefulWidget {
  final String title;
  const Notification1({
    super.key,
    required this.title,
  });

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.wifi),
          Icon(Icons.signal_cellular_alt), // Updated icon here
          Icon(Icons.battery_full),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search notifications',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NotificationCard(
              title: 'John Doe liked your post',
              subtitle: '2 hours ago',
              icon: Icons.mail,
            ),
            NotificationCard(
              title: 'New event: Study Group Meeting',
              subtitle: '1 day ago',
              icon: Icons.event,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Notification Preferences',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PreferenceItem(
              title: 'Frequency Settings',
              icon: Icons.notifications,
              trailing: 'Daily Digest',
            ),
            PreferenceItem(
              title: 'Do Not Disturb',
              icon: Icons.do_not_disturb_on,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}

class PreferenceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? trailing;

  const PreferenceItem({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(trailing!),
                const Icon(Icons.arrow_forward_ios),
              ],
            )
          : null,
    );
  }
}
