import 'package:flutter/material.dart';
import '../colors.dart';
import 'about.dart';

class MenuHelpComponent extends StatelessWidget {
  const MenuHelpComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      menuChildren: [
        // MenuItemButton(
        //   style: menuButton(context),
        //   child: const MenuAcceleratorLabel('Ajuda'),
        //   onPressed: () => print('ajuda'),
        // ),
        MenuItemButton(
          style: menuButton(context),
          child: const MenuAcceleratorLabel('Sobre'),
          onPressed: () => aboutDialog(context),
        ),
      ],
      child: const Text('Ajuda', style: TextStyle(color: Colors.white)),
    );
  }
}
