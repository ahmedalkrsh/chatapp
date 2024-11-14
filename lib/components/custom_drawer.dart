import 'package:chatapp/core/services/firebase_auth_service.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(child: 
          Center(
            child: Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 40,
            ),
          )
          ),
           Padding(
            padding:const EdgeInsets.only(left: 25),
            child: ListTile(
              title:const Text('H O M E'),
              leading:const Icon(
                Icons.home,)
                ,onTap: () {
                  Navigator.pop(context);}),
          ),
           Padding(
            padding: const  EdgeInsets.only(left: 25),
            child: ListTile(
              title:const  Text('S E T T I N G S'),
              leading: const Icon(
                Icons.settings,),
                onTap: () {
                  Navigator.pushReplacementNamed(context, SettingsPage.routeName);
                },),
          ), Padding(
            padding:const  EdgeInsets.only(left: 25),
            child: ListTile(
              title:const Text("L O G O U T"),
              leading:const Icon(
                Icons.logout,),
                onTap: () async {
              try {
                await FirebaseAuthService().logout(); // استخدم الخدمة هنا
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },),
          )
              
        ],
      )
    );
  }
}