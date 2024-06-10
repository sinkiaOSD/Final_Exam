import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Welcome Home',
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Notification button action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hello, User!',
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                    fontSize: 32,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            // Image Carousel
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.network(
                    'https://via.placeholder.com/400x200',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://via.placeholder.com/400x200',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://via.placeholder.com/400x200',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            // Feature highlights
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Features',
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FeatureTile(
                    icon: Icons.check_circle,
                    title: 'Task Management',
                    description: 'Manage your tasks efficiently.',
                  ),
                  FeatureTile(
                    icon: Icons.timeline,
                    title: 'Progress Tracking',
                    description: 'Track your progress over time.',
                  ),
                  FeatureTile(
                    icon: Icons.group,
                    title: 'Collaboration',
                    description: 'Work with your team seamlessly.',
                  ),
                ],
              ),
            ),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Action for the first button
                    },
                    child: const Text('Get Started'),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepPurple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Action for the second button
                    },
                    child: const Text(
                      'Learn More',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
