import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
        child: DataOwnerStatefull()));
  }
}


class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({super.key});

  @override
  State<DataOwnerStatefull> createState() => DataOwnerStatefullState();
}
class DataOwnerStatefullState extends State<DataOwnerStatefull> {
  var _value = 0;

  void increment(){
    
    setState(() {
      _value += 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: increment, child: const Text('Touch')),
         DataProviderInherited(
          value:  _value,
          child: const DataConsumerStateless())
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    // final value = context.findAncestorStateOfType<DataOwnerStatefullState>()?._value ?? 0;
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>()?.value ?? 0;
    return Container(
      child: Column(
        children: [
          Text('$value'),
          const DataConsumerStatfull(),
        ],
      ),
    );
  }
}

class DataConsumerStatfull extends StatefulWidget {
   const DataConsumerStatfull({super.key});

  @override
  State<DataConsumerStatfull> createState() => _DataConsumerStatfullState();
}

class _DataConsumerStatfullState extends State<DataConsumerStatfull> {
  @override
  Widget build(BuildContext context) {
    // final value = context.findAncestorStateOfType<DataOwnerStatefullState>()?._value ?? 0;
    // final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // final dataProvider = element?.widget as DataProviderInherited;
    getInheritElement<DataProviderInherited>(context);
    final value = getInheritElement<DataProviderInherited>(context)?.value ?? 0;
    return Text('$value');
  }
}

T? getInheritElement<T>(BuildContext context){
    final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    final widget = element?.widget;
    if(widget is T ){
      return widget as T;
    } else {
      return null;
    }
    
   
}

class DataProviderInherited extends InheritedWidget {
  const DataProviderInherited({super.key, required this.child, required this.value}) : super(child: child);
  
  final int value;
  final Widget child;


  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value;
  }
}