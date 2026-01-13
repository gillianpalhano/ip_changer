import 'package:flutter/material.dart';

var menuButton = (context) => ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered)) {
      return Theme.of(context).colorScheme.secondary; // hover
    }
    return Theme.of(context).colorScheme.primary; // padrão
  }),
  // backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
  foregroundColor: WidgetStateProperty.all(Colors.white),
);
