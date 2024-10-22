import 'package:flutter/material.dart';

import 'workout.dart';

Widget subtitleTitle (BuildContext context, Workout workout) {

  Color color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level){
    case 'first' : color = Colors.green;
    indicatorLevel = 0.2;
    break;
    case 'second' : color = Colors.yellow;
    indicatorLevel = 0.4;
    break;
    case 'third' : color = Colors.orange;
    indicatorLevel = 0.6;
    break;
    case 'four' : color = const Color.fromARGB(255, 255, 81, 0);
    indicatorLevel = 0.8;
    break;
    case 'fifth' : color = Colors.red;
    indicatorLevel = 1;
    break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        )),
       const SizedBox(width: 10,),
       Expanded(
        flex:3,
        child: Text(workout.level),)
    ],
  );
}