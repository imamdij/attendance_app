// Widget build(BuildContext context) {
//   return PopScope(
//       canPop: false, //mengunci tombol back perangkat
//       // ignore: deprecated_member_use
//       onPopInvoked: (bool didPop){
//         if(didPop){
//           return;
//         }
//         _onWillPop(context);
//       },
//       child: Scaffold(
//         appBar:AppBar(
//           backgroundColor: Colors.white,
//           title: const Text('Attendify',style: TextStyle(
//             fontFamily: 'Sofia Pro',
//           ),),
//         ),
//         backgroundColor: Colors.white,
//         body: SafeArea(
//             child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.all(10),
//                       child: InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const AttendScreen()));
//                           },
//                           child: const Column(
//                             children: [
//                               Image(image: AssetImage('assets/images/ic_absen.png'),
//                                 width: 100,
//                                 height: 100,
//                               ),
//                               SizedBox(height: 10,),
//                               Text('Absen Kehadiran', style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold
//                               ),)
//                             ],
//                           )
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(10),
//                       child:  InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const AbsentScreen()));
//                           },
//                           child: const Column(
//                             children: [
//                               Image(image: AssetImage('assets/images/ic_leave.png'),
//                                 width: 100,
//                                 height: 100,
//                               ),
//                               SizedBox(height: 10,),
//                               Text('Cuti / Izin', style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold
//                               ),)
//                             ],
//                           )
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(10),
//                       child: InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceHistoryScreen()));
//                           },
//                           child: const Column(
//                             children: [
//                               Image(image: AssetImage('assets/images/ic_history.png'),
//                                 width: 100,
//                                 height: 100,
//                               ),
//                               SizedBox(height: 10,),
//                               Text('Attendance History', style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold
//                               ),)
//                             ],
//                           )
//                       ),
//                     ),
//                   ],
//                 )
//             )
//         ),
//       )
//   );
// }