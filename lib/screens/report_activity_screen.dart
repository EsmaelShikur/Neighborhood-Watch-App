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
            ),
          ],
        ),
      ),
    );
  }
}
