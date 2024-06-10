import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Placeholder image
              ),
            ),
            const SizedBox(height: 20),
            ProfileDetail(
              icon: Icons.person,
              title: 'Name',
              value: 'Sinkia Akter',
            ),
            ProfileDetail(
              icon: Icons.school,
              title: 'Class Roll',
              value: '19cse026',
            ),
            ProfileDetail(
              icon: Icons.book,
              title: 'Hobby',
              value: 'Cooking',
            ),
            ProfileDetail(
              icon: Icons.home,
              title: 'Address',
              value: 'Section Road,Vatikhana,Barishal',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileDetail({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text(
            '$title:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
