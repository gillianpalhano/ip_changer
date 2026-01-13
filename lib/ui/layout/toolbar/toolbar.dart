import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import './button_theme.dart';
import './menu/index.dart';
import 'window_buttons.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        // color: Colors.deepOrange,
        color: Theme.of(context).colorScheme.primary,
        // height: 30,
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      // const Image(
                      //   image: AssetImage('assets/images/icon_tr.png'),
                      //   width: 24,
                      //   height: 24,
                      // ),
                      const SizedBox(width: 8),
                      const MenuComponent(),

                      // const MenuHelpComponent(),
                      const Expanded(child: SizedBox()),
                      const ButtonThemeComponent(),
                    ],
                  ),
                ),
              ),
            ),

            WindowButtons(),
          ],
        ),
      ),
    );
  }
}
