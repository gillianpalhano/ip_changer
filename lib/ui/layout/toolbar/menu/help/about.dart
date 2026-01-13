import 'package:flutter/material.dart';

void aboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          title: Center(
            child: Text(
              'Sobre o IP Changer',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 450),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image(image: AssetImage('assets/images/logo_laranja_1000.png'), height: 120),
                SizedBox(width: 40),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IP Changer'),
                    Text('Versão 1.0.0'),
                    SizedBox(height: 10),
                    Text('Desenvolvido por Gillian Palhano'),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Fechar'))],
        ),
  );
}
