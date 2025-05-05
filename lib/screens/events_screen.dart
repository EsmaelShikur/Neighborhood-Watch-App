import 'package:flutter/material.dart';
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of events with detailed information (title, date, and description)
    final List<Map<String, String>> events = [
      {
        "title": "Neighborhood BBQ",
        "date": "May 5th at 4 PM",
        "description":
            "Don't miss out on the fun! Food, drinks, and games for all ages.",
        "icon": "🏡",
      },
      {
        "title": "Annual Block Party",
        "date": "June 12th at 6 PM",
        "description":
            "Enjoy food, music, and games! Come and meet your neighbors.",
        "icon": "🎉",
      },
      {
        "title": "Morning Jogging Club",
        "date": "Every Saturday at 7 AM",
        "description":
            "Join us for fitness and a healthy start to your weekend!",
        "icon": "🚶‍♂️",
      },
      {
        "title": "Karaoke Night",
        "date": "May 20th at 8 PM",
        "description":
            "Show off your singing skills and have a blast with neighbors.",
        "icon": "🎤",
      },
      {
        "title": "Fall Cleanup Event",
        "date": "October 15th",
        "description":
            "Help keep the neighborhood beautiful by volunteering for our fall cleanup event.",
        "icon": "🍂",
      },
      {
        "title": "Family Picnic at the Park",
        "date": "July 25th",
        "description":
            "Bring your kids and a blanket for a day of fun and relaxation in the park.",
        "icon": "👨‍👩‍👧‍👦",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Neighborhood Events'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Add your event creation logic here if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: events.length, // List length from the sample events
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 8,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    events[index]['icon'] ?? '',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                title: Text(
                  events[index]['title'] ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${events[index]['date']}\n\n${events[index]['description']}',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.left,
                  ),
                ),
                isThreeLine: true, // Allows three lines of text
                trailing: Icon(Icons.calendar_today, color: Colors.blueAccent),
                onTap: () {
                  // Add your logic to view event details if needed
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
