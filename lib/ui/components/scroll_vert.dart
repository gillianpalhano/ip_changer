import 'package:flutter/material.dart';

class ScrollVerticalComponent extends StatefulWidget {
  final Widget child;

  const ScrollVerticalComponent({required this.child, super.key});

  @override
  State<ScrollVerticalComponent> createState() => _ScrollVerticalComponentState();
}

class _ScrollVerticalComponentState extends State<ScrollVerticalComponent> {
  final _verticalController = ScrollController();

  @override
  void dispose() {
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _verticalController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _verticalController,
        scrollDirection: Axis.vertical,
        child: widget.child,
      ),
    );
  }
}
