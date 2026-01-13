import 'package:flutter/material.dart';

class NavigationComponent extends StatefulWidget {
  const NavigationComponent({super.key});

  @override
  State<NavigationComponent> createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  var selectedIndex = 0;
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: isExtended, // constraints.maxWidth >= 600,
      destinations: [
        NavigationRailDestination(
          padding: EdgeInsets.zero,
          selectedIcon: Icon(Icons.home, size: 20, color: Colors.white),
          icon: Icon(Icons.home, size: 20),
          label: Text('Início', style: TextStyle(fontSize: 12)),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite),
          label: Text('Favoritos'),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          if(selectedIndex == value) {
            isExtended = !isExtended;
          } else {
            selectedIndex = value;
          }
        });
      },
    );
  }
}
