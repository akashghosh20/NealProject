import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  foregroundImage: AssetImage('assets/images/avatar.png'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Lian Mollick ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                ),
                Text(
                  'Embeded system engineer',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Tile(
                  name: 'Privacy',
                  icon: Icon(Icons.privacy_tip_outlined),
                ),
                Tile(
                  name: 'Policy',
                  icon: Icon(Icons.policy),
                ),
                Tile(
                  name: 'Settings',
                  icon: Icon(Icons.settings),
                ),
                Tile(
                  name: 'Security',
                  icon: Icon(Icons.security),
                ),
                Tile(
                  name: 'Logout',
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class Tile extends StatelessWidget {
  final String name;
  final Icon icon;
  Tile({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: icon,
        title: Text(name),
        tileColor: Color.fromARGB(255, 45, 200, 247).withOpacity(.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
