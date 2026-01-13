import 'package:flutter/material.dart';

Future<bool> confirmDialog(
  BuildContext context,
  {
    String title = 'Confirmar',
    String message = 'Deseja confirmar esta ação?',
    String confirmText = 'OK',
    String cancelText = 'Cancelar',
    bool barrierDismissible = false,
    bool isDanger = false, // quando true, botão de confirmar fica vermelho
    IconData? icon, // opcional
  }
) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      final titleWidget = icon == null
          ? Text(title)
          : Row(
              children: [
                Icon(
                  icon,
                  color: isDanger ? Colors.red : null,
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(title)),
              ],
            );

      return AlertDialog(
        title: titleWidget,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            style: isDanger
                ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
                : null,
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      );
    },
  );

  return result ?? false; // se fechar sem clicar, trata como cancelar
}
