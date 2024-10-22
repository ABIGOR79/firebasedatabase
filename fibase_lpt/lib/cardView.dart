
import 'package:flutter/material.dart';
import 'widget_subtitle.dart';
import 'workout.dart';

class CardView extends StatelessWidget {
  final Workout workout;

  const CardView({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              workout.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: subtitleTitle(context, workout), 
          ),
          const SizedBox(height: 8),
          Text('Автор: ${workout.author}'),
          const SizedBox(height: 8),
          Text('Уровень: ${workout.level}'),
          const SizedBox(height: 8),
          Text(workout.description),
        ],
      ),
    );
  }
}