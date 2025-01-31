import 'package:flutter/material.dart';
import 'package:flutter_absensi/ui/absen/absen_screen.dart';
import 'package:flutter_absensi/ui/attend/attend_screen.dart';
import 'package:flutter_absensi/ui/attendance_history/attendance_history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Attendify'),
        ),
        body: const AttendList(),
      ),
    );
  }
}

class AttendList extends StatelessWidget {
  const AttendList({super.key});

  @override
  Widget build(BuildContext context) {
    // List data untuk setiap card
    final List<Map<String, dynamic>> cards = [
      {
        'title': 'Data Collection of Attendance',
        'total': 17,
        'color': Colors.teal.shade300,
        'image': 'https://media.istockphoto.com/id/1303715147/vector/organized-archive-searching-files-in-database-records-management-records-and-information.jpg?s=612x612&w=0&k=20&c=S5Pyxu6Y3YAS9Z3UN7Y28h74T-r2d8YX0Rsi7dxr_OA=', // URL gambar
        'screen': AttendScreen(), // Screen tujuan
      },
      {
        'title': 'Licensing and Leave',
        'total': 3,
        'color': Colors.green.shade200,
        'image': 'https://5451430.fs1.hubspotusercontent-na1.net/hubfs/5451430/The%20Importance%20of%20an%20Attendance%20System%20Dashboard-%20Simplifying%20HR%20Management.jpg',
        'screen': AbsentScreen(),
      },
      {
        'title': 'History of Attendance',
        'total': 20,
        'color': Colors.greenAccent,
        'image': 'https://thumbs.dreamstime.com/b/time-attendance-tracking-system-abstract-concept-vector-illustration-clock-interactive-management-app-employee-monitoring-318417497.jpg',
        'screen': AttendanceHistoryScreen(),
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AttendCard(
              title: card['title'],
              totals: card['total'],
              color: card['color'],
              image: card['image'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => card['screen'], // Screen tujuan
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AttendCard extends StatelessWidget {
  final String title;
  final int totals;
  final Color color;
  final String image;
  final VoidCallback onTap;

  const AttendCard({
    super.key,
    required this.title,
    required this.totals,
    required this.color,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 200, // Tinggi card
        decoration: BoxDecoration(
          color: color.withOpacity(0.8), // Warna overlay (semi transparan)
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(2, 2),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover, // Mengisi seluruh card
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Overlay transparan
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Note: Filling in before the specified time',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const Spacer(),
              Text(
                'Total Employees Today: $totals',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Future<bool> _onWillPop(BuildContext context) async{
  return (await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("INFO"),
        content: const Text("Are you sure want to exit?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Yes"),
          )
        ],
      )
  )
  ) ?? false; //jika dialog ditutup tanpa aksi, maka kembalikan nilai false
}