import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../view_model/commpnas/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: appBackgroundGradient,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),

            // صورة المستخدم + الاسم
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/icons/boy-with-blue-hoodie-blue-hoodie-with-hoodie-it_1230457-42660.avif'), // صورة محلية أو Network
            ),
            const SizedBox(height: 12),
            const Text(
              'Abdo Shahin',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 4),
            const Text(
              'AbdoShahin@gmail.com',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 24),

            // القائمة
            Expanded(
              child: ListView(
                children: [
                  buildSettingTile(Icons.edit, 'Edit Profile'),
                  buildSettingTile(Icons.notifications_none, 'Notifications'),
                  buildSettingTile(Icons.favorite_border, 'Favorites'),
                  buildSettingTile(Icons.language, 'Language'),
                  buildSettingTile(Icons.support_agent, 'Support'),
                  buildSettingTile(Icons.logout, 'Logout',
                      iconColor: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingTile(IconData icon, String title,
      {Color iconColor = Colors.white}) {
    return ListTile(
      leading: Icon(icon, color: iconColor,size: 32,),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 24),
      onTap: () {
        // هنا تقدر تضيف التنقل لأي صفحة
      },
    );
  }
}
