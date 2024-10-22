import 'package:flutter/material.dart';

import 'workout_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: const Text('WorkOut'),),
      body: WorkOutList(),
    );
  }  

}