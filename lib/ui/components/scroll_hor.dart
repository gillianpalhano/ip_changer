import 'package:flutter/material.dart';

class ScrollHorizontalComponent extends StatefulWidget {
  final Widget child;

  const ScrollHorizontalComponent({required this.child, super.key});

  @override
  State<ScrollHorizontalComponent> createState() => _ScrollHorizontalComponentState();
}

class _ScrollHorizontalComponentState extends State<ScrollHorizontalComponent> {
  final _horizontalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _horizontalController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        child: widget.child,
      ),
    );
  }
}
