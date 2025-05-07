import 'package:flutter/material.dart';
class ReportActivityScreen extends StatefulWidget {
  const ReportActivityScreen({super.key});

  @override
  _ReportActivityScreenState createState() => _ReportActivityScreenState();
}

class _ReportActivityScreenState extends State<ReportActivityScreen> {
  final _activityController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Suspicious Activity'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Text
            Text(
              "Please provide the details below:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Suspicious Activity Input
            TextField(
              controller: _activityController,
              decoration: InputDecoration(
                labelText: 'Describe Suspicious Activity',
                labelStyle: TextStyle(color: Colors.blueAccent),
                hintText: 'Be as detailed as possible',
                hintStyle: TextStyle(color: Colors.grey[600]),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                ),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            
            // Location Input
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                labelStyle: TextStyle(color: Colors.blueAccent),
                hintText: 'Where did it happen?',
                hintStyle: TextStyle(color: Colors.grey[600]),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Add your logic for submitting the report
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Report Submitted')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blueAccent, // backgroundColor instead of primary
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(  
                'Submit Report',
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

