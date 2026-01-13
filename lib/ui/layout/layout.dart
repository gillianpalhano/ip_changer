import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
// import '../components/scroll.dart';
import './toolbar/footer.dart';

import 'side_bar.dart';
import 'toolbar/toolbar.dart';

class LayoutMain extends StatelessWidget {
  final Widget child;
  const LayoutMain({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: WindowBorder(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
            child: SizedBox.expand(
              child: Column(
                children: [
                  Toolbar(),
                  Expanded(
                    child: Row(
                      children: [
                        CustomSidebar(),
                        Expanded(
                          // child: ScrollComponent(child: child),
                          child: child,
                        ),
                      ],
                    ),
                  ),
                  // rodapé
                  Footer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
