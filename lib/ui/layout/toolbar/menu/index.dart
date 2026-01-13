import 'package:flutter/material.dart';
import './help/index.dart';
// import './file.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuBar(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
        surfaceTintColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
      ),
      children: [
        // MenuFileComponent(),
        MenuHelpComponent()
      ],
    );
  }
}
