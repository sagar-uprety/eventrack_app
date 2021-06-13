// import 'package:eventrack_app/app/utilities/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttericon/font_awesome5_icons.dart';

// class ImageContainer extends StatelessWidget {
//   const ImageContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       width: double.infinity,
//       height: 300,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(
//             'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
//           ),
//         ),
//       ),
//       child: Container(
//         height: 60,
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               AppColors.background,
//               AppColors.background.withOpacity(0.7),
//               AppColors.transparent,
//             ],
//           ),
//         ),
//         child: ImageText(),
//       ),
//     );
//   }
// }

// class ImageText extends StatelessWidget {
//   const ImageText({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'EventTrack',
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           Row(
//             children: [
//               Icon(
//                 Icons.calendar_today_outlined,
//                 size: 15,
//                 color: Colors.purple,
//               ),
//               SizedBox(width: 4),
//               Text(
//                 '2021/06/09',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyText1!
//                     .copyWith(fontSize: 16),
//               ),
//               SizedBox(
//                 width: 120.0,
//               ),
//               Icon(
//                 FontAwesome5.clock,
//                 size: 15,
//                 color: Colors.purple,
//               ),
//               SizedBox(width: 4),
//               Text(
//                 '2PM-3PM',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyText1!
//                     .copyWith(fontSize: 16),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
