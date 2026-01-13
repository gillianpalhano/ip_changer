import 'dart:io';

bool isAdmin() {
  if (!Platform.isWindows) {
    throw UnsupportedError('Only Windows is supported');
  }
  final r = Process.runSync('net', ['session']);
  return r.exitCode == 0;
}