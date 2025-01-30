import 'package:flutter/material.dart';

import 'absen/absen_screen.dart';
import 'attend/attend_screen.dart';
import 'attendance_history/attendance_history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false, //mengunci tombol back perangkat
        // ignore: deprecated_member_use
        onPopInvoked: (bool didPop){
          if(didPop){
            return;
          }
          _onWillPop(context);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()));
                            },
                            child: const Column(
                              children: [
                                Image(image: AssetImage('assets/images/ic_absen.png'),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 10,),
                                Text('Absen Kehadiran', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child:  InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AbsentScreen()));
                            },
                            child: const Column(
                              children: [
                                Image(image: AssetImage('assets/images/ic_leave.png'),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 10,),
                                Text('Cuti / Izin', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceHistoryScreen()));
                            },
                            child: const Column(
                              children: [
                                Image(image: AssetImage('assets/images/ic_history.png'),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 10,),
                                Text('Attendance History', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            )
                        ),
                      ),
                    ],
                  )
              )
          ),
        )
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