import 'package:flutter/material.dart';
import 'dart:math'; // For random picking


class SafetyTipsScreen extends StatefulWidget {
  @override
  _SafetyTipsScreenState createState() => _SafetyTipsScreenState();
}

class _SafetyTipsScreenState extends State<SafetyTipsScreen> {
  final List<String> safetyTips = [
    "🔒 Always lock your doors and windows, even when you're at home.",
    "🌃 Avoid walking alone at night in poorly lit areas.",
    "👀 Be alert and aware of your surroundings at all times.",
    "🚨 Report any suspicious activity immediately to the authorities.",
    "📱 Keep emergency contacts easily accessible.",
    "💡 Install motion-sensor lights around your home exterior.",
    "🚗 Never leave valuables visible inside your car.",
    "👫 Organize a neighborhood watch group with your neighbors.",
    "🏠 Install a reliable security system if possible.",
    "🐕 Consider having a dog — pets can deter intruders!",
  ];

  String tipOfTheDay =
      "🔒 Always lock your doors and windows, even when you're at home.";

  void _refreshTip() {
    setState(() {
      tipOfTheDay = safetyTips[Random().nextInt(safetyTips.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> shuffledTips = List.from(safetyTips)..shuffle(Random());

    return Scaffold(
      appBar: AppBar(title: Text('Safety Tips')),
      body: Column(
        children: [
          // Tip of the Day banner with Refresh Button
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🌟 Tip of the Day!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  tipOfTheDay,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _refreshTip,
                  child: Text('Refresh Tip'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Correct background color
                    foregroundColor: Colors.white, // Correct text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),

          // List of shuffled safety tips
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: shuffledTips.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.shield, color: Colors.blue),
                    title: Text(
                      shuffledTips[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
