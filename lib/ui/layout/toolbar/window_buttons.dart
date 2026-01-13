import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void _toggleMaximizeRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColors = WindowButtonColors(
      iconNormal: Colors.black,
      mouseOver: Theme.of(context).colorScheme.secondary,
      mouseDown: Theme.of(context).colorScheme.tertiary,
      iconMouseOver: Colors.white,
      iconMouseDown: Colors.white,
    );

    final closeButtonColors = WindowButtonColors(
      iconNormal: Colors.black,
      mouseOver: const Color(0xFFD32F2F),
      mouseDown: const Color(0xFFD32F2F),
      iconMouseDown: Colors.white,
      iconMouseOver: Colors.white,
    );

    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: _toggleMaximizeRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: _toggleMaximizeRestore,
              ),
        CloseWindowButton(
          colors: closeButtonColors,
          onPressed: () {
            // debugPrint('tchau!');
            appWindow.close();
          },
        ),
      ],
    );
  }
}
