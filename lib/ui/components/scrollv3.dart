import 'package:flutter/material.dart';

class ScrollComponent extends StatefulWidget {
  final Widget child;
  const ScrollComponent({required this.child, super.key});

  @override
  State<ScrollComponent> createState() => _ScrollComponentState();
}

class _ScrollComponentState extends State<ScrollComponent> {
  final _vCtrl = ScrollController();
  final _hCtrl = ScrollController();

  @override
  void dispose() {
    _vCtrl.dispose();
    _hCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return Scrollbar(
        controller: _vCtrl,                            // 👈 MESMO controller
        thumbVisibility: true,
        notificationPredicate: (n) => n.metrics.axis == Axis.vertical,
        child: SingleChildScrollView(
          controller: _vCtrl,                          // 👈 MESMO controller
          primary: false,
          scrollDirection: Axis.vertical,
          child: Scrollbar(
            controller: _hCtrl,                        // 👈 MESMO controller
            thumbVisibility: true,
            notificationPredicate: (n) => n.metrics.axis == Axis.horizontal,
            child: SingleChildScrollView(
              controller: _hCtrl,                      // 👈 MESMO controller
              primary: false,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: c.maxWidth),
                child: widget.child,
              ),
            ),
          ),
        ),
      );
    });
  }
}
