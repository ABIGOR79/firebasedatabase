import 'package:fibase_lpt/cardView.dart';
import 'package:flutter/material.dart';

import '../../workout.dart';

class WorkOutList extends StatelessWidget {
  WorkOutList({super.key});

final workOuts = <Workout>[
  Workout(title: 'test1', author: 'abi', description: 'trulala', level: 'first'),
  Workout(title: 'test2', author: 'eli', description: 'bugaga', level: 'second'),
  Workout(title: 'test3', author: 'ala', description: 'tatat', level: 'third'),
  Workout(title: 'test4', author: 'asm', description: 'someone4', level: 'four'),
  Workout(title: 'test5', author: 'sam', description: 'someone5', level: 'fifth'),
];

  @override
  Widget build(BuildContext context) {
    
return ListView.builder(
 itemCount: workOuts.length,
 itemBuilder: (context, i){
   return Card(    
     elevation: 2.0,
     margin: const EdgeInsets.all(8.0),
     child: CardView( workout: workOuts[i])
   
   );
 },
);
  }
}