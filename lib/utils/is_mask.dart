import './is_ipv4.dart';

/// Verifica se a máscara em formato CIDR é válida (ex.: /24)
bool isMaskCidr(String s) {
  if (s.trim().isEmpty || !s.startsWith('/')) return false;

  final n = int.tryParse(s.substring(1));
  if (n == null || n < 0 || n > 32) return false;
  return true;
}

/// Verifica se a máscara em formato decimal pontuado é válida e contígua.
bool isMaskDotted(String s) {
  final parts = s.split('.');
  if (!isIPv4(s)) return false;
  
  // máscara contígua: padrão 1...10...0
  final oct = parts.map((e) => int.parse(e)).toList();
  int bits = 0;
  for (final o in oct) {
    bits = (bits << 8) | o;
  }
  // regra: bits tem a forma 111..1100..00 (ou tudo 0)
  // checagem: (bits & (~bits + 1)) pega o menor bit 1 setado,
  // então (bits ^ 0xFFFFFFFF) deve ser tudo 0 após os 1s contíguos
  // Implementação direta: não pode haver transição 0->1 após aparecer um 0
  bool seenZero = false;
  for (int i = 31; i >= 0; i--) {
    final bit = (bits >> i) & 1;
    if (bit == 0) {
      seenZero = true;
    } else if (seenZero) {
      // encontrou 1 depois de ter visto 0 => não contígua
      return false;
    }
  }
  return true;
}

/// Verifica se é máscara, independente do formato
bool isMask(String s) {
  return isMaskCidr(s) || isMaskDotted(s);
}