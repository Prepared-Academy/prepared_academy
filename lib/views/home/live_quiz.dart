// // ignore_for_file: must_be_immutable

// import 'package:auto_animated/auto_animated.dart';
// import 'package:flutter/material.dart';
// import 'package:prepared_academy/animation/animation_list.dart';
// import 'package:prepared_academy/themes/color_theme.dart';
// import 'package:prepared_academy/widgets/buttons.dart';

// class LiveQuiz extends StatelessWidget {
//   LiveQuiz({super.key});

//   List<Map<String, dynamic>> coursesList = [
//     {
//       "subject": "Programming",
//       "teacher": "Moin khan",
//       "title": "All about Node JS",
//       "type": true,
//       "done": false
//     },
//     {
//       "subject": "Mathematics",
//       "teacher": "Hamdan",
//       "title": "Algorithms Engineering",
//       "type": true,
//       "done": true
//     },
//     {
//       "subject": "English",
//       "teacher": "Jhone Doe",
//       "title": "Regulate your tenses",
//       "type": true,
//       "done": true
//     },
//     {
//       "subject": "Biology",
//       "teacher": "Erick Bert",
//       "title": "Symptoms preficiency in the verins",
//       "type": true,
//       "done": false
//     },
//   ];
//   final scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("Live Quizes"),
//       ),
//       body: LiveGrid(
//         padding: const EdgeInsets.all(16),
//         itemCount: coursesList.length,
//         controller: scrollController,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemBuilder: ((context, index, animation) => AnimationScaleList(
//               animation: animation,
//               widget: Container(
//                 decoration: BoxDecoration(
//                   color: coursesList[index]["done"] == true
//                       ? Colors.white
//                       : Colors.black.withOpacity(0.8),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(blurRadius: 5, color: kShadow, spreadRadius: 1)
//                   ],
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(20),
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.all(14.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           coursesList[index]["type"] == false
//                               ? const SizedBox()
//                               : Align(
//                                   alignment: Alignment.topRight,
//                                   child: Row(
//                                     children: const [
//                                       Icon(
//                                         Icons.timer_outlined,
//                                         color: kPrimaryColor,
//                                       ),
//                                       SizedBox(width: 5),
//                                       Text(
//                                         "30 Sec",
//                                         style: TextStyle(
//                                           color: kPrimaryColor,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   coursesList[index]["subject"].toUpperCase(),
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: coursesList[index]["done"] == true
//                                           ? Colors.black
//                                           : Colors.white,
//                                       fontSize: 12),
//                                 ),
//                                 Text(
//                                   coursesList[index]["teacher"],
//                                   style: TextStyle(
//                                       color: coursesList[index]["done"] == true
//                                           ? Colors.black
//                                           : Colors.white,
//                                       fontSize: 12),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   coursesList[index]["title"],
//                                   maxLines: 2,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       overflow: TextOverflow.ellipsis,
//                                       color: coursesList[index]["done"] == true
//                                           ? Colors.black
//                                           : Colors.white,
//                                       fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           MiniElevatedButton(
//                             backgroundColor: coursesList[index]["done"] == true
//                                 ? Colors.green.shade700
//                                 : kPrimaryColor,
//                             fullWidth: true,
//                             onPressed: () {},
//                             text: coursesList[index]["done"] == true
//                                 ? "View Score"
//                                 : "Launch Quiz",
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }
