import 'package:flutter/material.dart';
import 'report_activity_screen.dart';
import 'events_screen.dart';
import 'discussions_screen.dart';
import 'safety_tips_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes the app bar transparent
        elevation: 0, // Removes the shadow for a clean look
      ),
      extendBodyBehindAppBar:
          true, // Ensures the background extends behind the app bar
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome message
              Text(
                'Welcome to Your Neighborhood Watch!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Report Suspicious Activity button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportActivityScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Adding shadow
                ),
                icon: Icon(Icons.report_problem, color: Colors.blueAccent),
                label: Text(
                  'Report Suspicious Activity',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // Neighborhood Events button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Adding shadow
                ),
                icon: Icon(Icons.event, color: Colors.blueAccent),
                label: Text(
                  'Neighborhood Events',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // Discussions button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiscussionsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Adding shadow
                ),
                icon: Icon(Icons.forum, color: Colors.blueAccent),
                label: Text(
                  'Discussions',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // Safety Tips button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SafetyTipsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Button color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Adding shadow
                ),
                icon: Icon(Icons.security, color: Colors.blueAccent),
                label: Text(
                  'Safety Tips',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
