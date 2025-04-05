import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "John Doe";
  final String userEmail = "johndoe@email.com";
  final String userService = "Graphic Designer";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), backgroundColor: Colors.blue),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/profile.jpg",
                ), // Change with real user image
              ),
              SizedBox(height: 10),
              Text(
                userName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                userEmail,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 5),
              Chip(
                label: Text(userService),
                backgroundColor: Colors.blue.shade100,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement Edit Profile
                },
                icon: Icon(Icons.edit),
                label: Text("Edit Profile"),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement Logout
                },
                icon: Icon(Icons.logout),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                label: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
