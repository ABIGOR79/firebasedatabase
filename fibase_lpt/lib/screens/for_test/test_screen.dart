import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var stateToggle = true;

  void changeToggle() {
    setState(() {
      stateToggle = !stateToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: changeToggle,
            child: Text(stateToggle ? 'Collapse' : 'Expand'),
          ),
          Center(
            child: CollapseAnimatedBox(
              isCollapse: stateToggle,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollapseAnimatedBox extends StatefulWidget {
  final Duration duration;
  final bool isCollapse;
  final Widget child;

  const CollapseAnimatedBox({
    super.key,
    required this.duration,
    required this.isCollapse,
    required this.child,
  });

  @override
  State<CollapseAnimatedBox> createState() => _CollapseAnimatedBoxState();
}

class _CollapseAnimatedBoxState extends State<CollapseAnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);

    // Устанавливаем значение анимации в зависимости от начального состояния
    if (widget.isCollapse) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant CollapseAnimatedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapse == widget.isCollapse) return;

    // Меняем направление анимации в зависимости от изменения состояния
    if (widget.isCollapse) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      axisAlignment: 0.0,
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
        child: widget.child, // используем child вместо widget.widget
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
