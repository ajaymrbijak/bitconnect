// import 'package:dashed_circle/dashed_circle.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:story_view/widgets/story_view.dart';


// class StorlyView extends StatefulWidget {
//   const StorlyView({super.key});

//   @override
//   State<StorlyView> createState() => _StorlyViewState();
// }

// class _StorlyViewState extends State<StorlyView> {
//   late Animation<double> gap;
//   late Animation<double> base;
//   late Animation<double> reverse;
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 10));
//     base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
//     reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
//     gap = Tween<double>(begin: 15.0, end: 0.0).animate(base)
//       ..addListener(() {
//         setState(() {});
//       });
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         return Get.to(StoryViewPage(index: index, model: model));
//       },
//       child: RotationTransition(
//         turns: base,
//         child: DashedCircle(
//           gapSize: gap.value,
//           dashes: 20,
//           color: Theme.of(context).primaryColor,
//           child: RotationTransition(
//             turns: reverse,
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: CircleAvatar(
//                 radius: 25.0,
//                 backgroundImage: NetworkImage(model[index]),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class   StoryView extends StatefulWidget {
//   final dynamic index;
//     final dynamic model;
//   const   StoryView({super.key, required List<StoryItem> storyItems, this.index, this.model});

//   @override
//   State<StoryView> createState() => _StoryViewState();
// }

// class _StoryViewState extends State<  StoryView> {
//   @override
//   Widget build(BuildContext context) {
//     return StoryView(
//               storyItems: [
//                 for (int i = widget.index; i < widget.model.length; i++)
//                   StoryItem.inlineImage(
//                       imageFit: BoxFit.contain,
//                       caption: const Text(
//                         "Caption Here",
//                         style: TextStyle(
//                             color: Colors.white,
//                             backgroundColor: Colors.black,
//                             fontSize: 17),
//                       ),
//                       url: widget.model[i],
//                       controller: storyController)
//               ],
//               onStoryShow: (s) {},
//               onComplete: () {},
//               progressPosition: ProgressPosition.top,
//               repeat: false,
//               inline: true,
//               controller: storyController),
//   }
// }

  
// }
