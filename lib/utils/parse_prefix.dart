/// Aceita "24" ou "/24". Retorna null se inválido.
int? parsePrefix(String raw) {
  final s = raw.trim();
  final cleaned = s.startsWith('/') ? s.substring(1) : s;
  final n = int.tryParse(cleaned);
  if (n == null || n < 0 || n > 32) return null;
  return n;
}