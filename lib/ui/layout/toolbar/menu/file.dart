import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';

// import 'package:capacitor_swap/state/swap_state.dart';
import './colors.dart';

class MenuFileComponent extends StatelessWidget {
  const MenuFileComponent({super.key});

  // Future<void> openFile(BuildContext context) async {
  //   var swapState = context.read<SwapState>();
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['csf'],
  //   );

  //   if (result != null) {
  //     print('abrindo arquivo personalizado...');
  //     final textFile = await File(result.files.single.path!).readAsString(encoding: utf8);
  //     final jsonData = jsonDecode(textFile);

  //     if (jsonData['version'] != "1.0" || jsonData['bank'] == null) {
  //       print('Arquivo inválido: versão ou estrutura incorreta');
  //       return;
  //     }

  //     swapState.setSystemFile(jsonData['bank']);

  //     if (jsonData['spares'] != null) {
  //       swapState.setSpareFile(jsonData['spares']);
  //     }

  //     List<double> desbalance = calcDesbalance(swapState.getSystem!);
  //     swapState.setDesbalanceBefore(desbalance);
  //   } else {
  //     print('nenhum arquivo selecionado');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // var menuButton = ButtonStyle(
    //   backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
    //   foregroundColor: WidgetStateProperty.all(Colors.white),
    // );
    return SubmenuButton(
      menuChildren: [
        MenuItemButton(
          style: menuButton(context),
          onPressed: () => print('novo'),
          child: const MenuAcceleratorLabel('&Novo'),
          // onPressed: () => print('Novo'),
        ),
        MenuItemButton(
          style: menuButton(context),
          child: const MenuAcceleratorLabel('&Abrir'),
          onPressed: () => print('abrir'),
        ),
        MenuItemButton(
          style: menuButton(context),
          onPressed: () => print('Salvar'),
          // onPressed: null,
          child: const MenuAcceleratorLabel('&Salvar'),
        ),
      ],
      child: const Text('Arquivo', style: TextStyle(color: Colors.white)),
    );
  }
}
