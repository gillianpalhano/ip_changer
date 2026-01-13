import 'package:ip_changer/models/net_row.dart';

List<NetRow> deepCopyRows(List<NetRow> rows) {
  return rows.map((r) => NetRow.fromJson(r.toJson())).toList();
}