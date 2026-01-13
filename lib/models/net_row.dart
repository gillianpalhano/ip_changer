import 'package:flutter/material.dart';

class NetRow {
  NetRow({
    required this.id,
    String? desc,
    String? ip,
    String? mask,
    String? interfaceName,
    String? gw,
    String? dnsJoined, // no UI: "8.8.8.8;1.1.1.1"
  })  : descCtrl = TextEditingController(text: desc ?? ''),
        ipCtrl = TextEditingController(text: ip ?? ''),
        maskCtrl = TextEditingController(text: mask ?? ''),
        // interfaceNameCtrl = TextEditingController(text: interfaceName ?? ''),
        interfaceName = interfaceName ?? '',
        gwCtrl = TextEditingController(text: gw ?? ''),
        dnsCtrl = TextEditingController(text: dnsJoined ?? '');

  final String id;
  final TextEditingController descCtrl;
  final TextEditingController ipCtrl;
  final TextEditingController maskCtrl;
  // final TextEditingController interfaceNameCtrl;
  String interfaceName = '';
  final TextEditingController gwCtrl;
  final TextEditingController dnsCtrl;


  void dispose() {
    descCtrl.dispose();
    ipCtrl.dispose();
    maskCtrl.dispose();
    // interfaceNameCtrl.dispose();
    gwCtrl.dispose();
    dnsCtrl.dispose();
  }

  Map<String, dynamic> toJson() {
    final dnsList = dnsCtrl.text
        .split(RegExp(r'[;,]')) // aceita ; ou , como separador
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    return {
      'id': id,
      'desc': descCtrl.text.trim(),
      'ip': ipCtrl.text.trim(),
      'mask': maskCtrl.text.trim(),
      'interfaceName': interfaceName.trim(),
      'gw': gwCtrl.text.trim(),
      'dns': dnsList, // no arquivo vai como lista JSON
    };
  }

  static NetRow fromJson(Map<String, dynamic> j) {
    final dnsList = (j['dns'] is List)
        ? (j['dns'] as List).map((e) => (e ?? '').toString()).toList()
        : <String>[];
    return NetRow(
      id: (j['id'] ?? '').toString(),
      desc: (j['desc'] ?? '').toString(),
      ip: (j['ip'] ?? '').toString(),
      mask: (j['mask'] ?? '').toString(),
      interfaceName: (j['interfaceName'] ?? '').toString(),
      gw: (j['gw'] ?? '').toString(),
      dnsJoined: dnsList.join(';'),
    );
  }
}