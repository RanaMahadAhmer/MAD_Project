
// Profile Screen
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/ProfileDTO.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ProfileDTO profile = ModalRoute.of(context)!.settings.arguments as ProfileDTO;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("My Profile")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(radius: 64,foregroundImage: AssetImage("assets/images/my_pic.jpg")),
                SizedBox(height: 16),
                Text(profile.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                buildInfoRow(Icons.phone, "Phone", profile.phone),
                buildInfoRow(Icons.email, "Email", profile.email),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.fingerprint, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Biometric", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Switch(
                              // This bool value toggles the switch.
                              value: profile.biometric,

                              onChanged: (bool value) {
                                // This is called when the user toggles the switch.
                                setState(() {
                                  profile.biometric= value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),



                buildInfoRow(Icons.location_on, "Address", profile.address),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(value, style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
