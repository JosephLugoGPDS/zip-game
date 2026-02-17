import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:app/puzzle/data/model/levels.dart';

class OffsetInt {
  final int r, c;
  const OffsetInt(this.r, this.c);

  @override
  bool operator ==(Object other) =>
      other is OffsetInt && other.r == r && other.c == c;

  @override
  int get hashCode => r * 100000 + c;

  @override
  String toString() => '($r,$c)';

  /// Vecinos 4-direcciones válidos dentro del grid
  List<OffsetInt> adjacent(int rows, int cols) {
    final out = <OffsetInt>[];
    if (r > 0) out.add(OffsetInt(r - 1, c));
    if (r < rows - 1) out.add(OffsetInt(r + 1, c));
    if (c > 0) out.add(OffsetInt(r, c - 1));
    if (c < cols - 1) out.add(OffsetInt(r, c + 1));
    return out;
  }
}

class Level {
  final int rows;
  final int cols;
  final List<OffsetInt> solutionPath; // camino que pasa por todas las celdas
  final Map<int, OffsetInt> numberPositions; // 1..N -> coordenadas

  Level({
    required this.rows,
    required this.cols,
    required this.solutionPath,
    required this.numberPositions,
  });

  //// DEbug level en cache
  ///
  ///

  static Level loadLevelFromConst(Map<String, dynamic> data) {
    return Level(
      rows: data['rows'],
      cols: data['cols'],
      solutionPath:
          (data['path'] as List).map((p) => OffsetInt(p['r'], p['c'])).toList(),
      numberPositions: {
        for (var n in (data['numbers'] as List))
          n['value']: OffsetInt(n['r'], n['c'])
      },
    );
  }

  void debugDumpLevel() {
    final json = {
      'rows': rows,
      'cols': cols,
      'path': solutionPath.map((p) => {'r': p.r, 'c': p.c}).toList(),
      'numbers': numberPositions.entries
          .map((entry) =>
              {'value': entry.key, 'r': entry.value.r, 'c': entry.value.c})
          .toList(),
    };
    print('LEVEL_JSON = ${jsonEncode(json)}');
  }

  void debugDumpLevelAsConst(String varName) {
    final mapData = {
      'rows': rows,
      'cols': cols,
      'path': solutionPath.map((p) => {'r': p.r, 'c': p.c}).toList(),
      'numbers': numberPositions.entries
          .map((entry) =>
              {'value': entry.key, 'r': entry.value.r, 'c': entry.value.c})
          .toList(),
    };

    final dartLiteral = const JsonEncoder.withIndent('  ').convert(mapData);
    print('const $varName = $dartLiteral;');
  }

  /// Generar nivel FAST
  ///
  ///
  static Level getMemoryRandomLevel() {
    final idx = Random().nextInt(levels.length);
    return loadLevelFromConst(levels[idx]);
  }

  static Level generateFast({
    required int rows,
    required int cols,
    required int numbers,
    OffsetInt? start,
    OffsetInt? end,
    int maxAttempts = 10, // antes era 200
  }) {
    assert(numbers >= 2);

    //remove local
    final memoryLevel = getMemoryRandomLevel();
    return memoryLevel;

    final rng = Random();

    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      final s = start ?? OffsetInt(rng.nextInt(rows), rng.nextInt(cols));
      final e = end ??
          (() {
            OffsetInt candidate;
            do {
              candidate = OffsetInt(rng.nextInt(rows), rng.nextInt(cols));
            } while (candidate == s);
            return candidate;
          })();

      final path = _findHamiltonianPath(s, rows, cols, rng, targetEnd: e);
      if (path != null) {
        final numberPos = _distributeNumbers(path, numbers);
        return Level(
          rows: rows,
          cols: cols,
          solutionPath: path,
          numberPositions: numberPos,
        );
      }

      if (start != null && end != null) break;
    }

    // fallback directo
    final fallback = _snakePath(rows, cols);
    return Level(
      rows: rows,
      cols: cols,
      solutionPath: fallback,
      numberPositions: _distributeNumbers(fallback, numbers),
    );
  }

  static Map<int, OffsetInt> _distributeNumbers(
      List<OffsetInt> path, int numbers) {
    final numberPos = <int, OffsetInt>{};
    final total = path.length;
    for (int i = 0; i < numbers; i++) {
      final idx = ((i * (total - 1)) / (numbers - 1)).round();
      numberPos[i + 1] = path[idx.clamp(0, total - 1)];
    }
    return numberPos;
  }

  static List<OffsetInt> _snakePath(int rows, int cols) {
    final path = <OffsetInt>[];
    for (int r = 0; r < rows; r++) {
      if (r.isEven) {
        for (int c = 0; c < cols; c++) path.add(OffsetInt(r, c));
      } else {
        for (int c = cols - 1; c >= 0; c--) path.add(OffsetInt(r, c));
      }
    }
    return path;
  }

  /// Genera un nivel que:
  ///  - tiene un path que pasa por todas las casillas (Hamiltonian path),
  ///  - empieza en `start` (si se proporciona) o en uno aleatorio,
  ///  - termina en `end` (si se proporciona) o en uno aleatorio,
  ///  - y coloca [numbers] números en orden desde el inicio hasta el fin
  ///
  /// Si no se encuentra un camino en `maxAttempts`, lanza excepción (puedes cambiar
  /// para fallback si lo prefieres).
  static Level generate({
    required int rows,
    required int cols,
    required int numbers,
    OffsetInt? start,
    OffsetInt? end,
    int maxAttempts = 10,
  }) {
    assert(
        numbers >= 2, 'numbers debe ser al menos 2 para tener inicio y fin.');
    final rng = Random();

    // Si se pasan start/end, se usan. Si no, se seleccionan aleatoriamente.
    for (int attempt = 0; attempt < maxAttempts; attempt++) {
      final s = start ?? OffsetInt(rng.nextInt(rows), rng.nextInt(cols));
      final e = end ??
          // escoge un end diferente al start (intento)
          (() {
            OffsetInt candidate;
            do {
              candidate = OffsetInt(rng.nextInt(rows), rng.nextInt(cols));
            } while (candidate == s);
            return candidate;
          })();

      final path = _findHamiltonianPath(s, rows, cols, rng, targetEnd: e);
      if (path != null) {
        // Aseguramos que path[0] == s y path.last == e
        // Colocamos los números en orden a lo largo del path
        final numberPos = <int, OffsetInt>{};

        // Queremos que 1 esté en path[0] y numbers esté en path[last].
        // Distribuimos equiespaciado entre 0 .. path.length-1
        final total = path.length;
        // Calculamos índices garantizando último igual a total-1
        for (int i = 0; i < numbers; i++) {
          // índice distribuido entre 0 y total-1
          final idx = ((i * (total - 1)) / (numbers - 1)).round();
          numberPos[i + 1] = path[idx.clamp(0, total - 1)];
        }

        return Level(
          rows: rows,
          cols: cols,
          solutionPath: path,
          numberPositions: numberPos,
        );
      }

      // si falló con ese start/end, si los pasaste explícitos no pruebo otro start/end
      if (start != null && end != null) break;
      // si alguno no fue pasado, el loop intentará otra combinación aleatoria
    }

    // fallback: intenta construir un snake (recorrido simple) y forzar start/end si posible
    final fallback = <OffsetInt>[];
    for (int r = 0; r < rows; r++) {
      if (r % 2 == 0) {
        for (int c = 0; c < cols; c++) fallback.add(OffsetInt(r, c));
      } else {
        for (int c = cols - 1; c >= 0; c--) fallback.add(OffsetInt(r, c));
      }
    }

    // Si user especificó start/end y no coinciden con snake, no garantizamos target end.
    final numberPos = <int, OffsetInt>{};
    final total = fallback.length;
    for (int i = 0; i < numbers; i++) {
      final idx = ((i * (total - 1)) / (numbers - 1)).round();
      numberPos[i + 1] = fallback[idx.clamp(0, total - 1)];
    }

    return Level(
      rows: rows,
      cols: cols,
      solutionPath: fallback,
      numberPositions: numberPos,
    );
  }

  /// Backtracking para encontrar camino Hamiltoniano desde [current].
  /// Si [targetEnd] != null, solo acepta soluciones cuyo último elemento sea targetEnd.
  ///
  /// Retorna el path completo (lista) o null si no encontró.
  static List<OffsetInt>? _findHamiltonianPath(
    OffsetInt current,
    int rows,
    int cols,
    Random rng, {
    OffsetInt? targetEnd,
    Set<OffsetInt>? visited,
    List<OffsetInt>? path,
  }) {
    visited ??= <OffsetInt>{};
    path ??= <OffsetInt>[];

    visited.add(current);
    path.add(current);

    // Si completamos
    if (path.length == rows * cols) {
      if (targetEnd == null || path.last == targetEnd) {
        return List<OffsetInt>.from(path);
      } else {
        // no es el end buscado -> no es solución válida
        visited.remove(current);
        path.removeLast();
        return null;
      }
    }

    // heurística: ordena vecinos por número de futuros movimientos posibles (Warnsdorff),
    // así evitamos cierres tempranos; mezclamos empates aleatoriamente.
    final neighbors = current
        .adjacent(rows, cols)
        .where((p) => !visited!.contains(p))
        .toList();

    // Si targetEnd está definido, priorizamos movimientos que acercan a targetEnd
    neighbors.sort((a, b) {
      // 1) distancia manhattan a targetEnd (si existe)
      if (targetEnd != null) {
        final da = (a.r - targetEnd.r).abs() + (a.c - targetEnd.c).abs();
        final db = (b.r - targetEnd.r).abs() + (b.c - targetEnd.c).abs();
        if (da != db) return da.compareTo(db);
      }
      // 2) Warnsdorff: menos vecinos libres primero
      final aCount =
          a.adjacent(rows, cols).where((n) => !visited!.contains(n)).length;
      final bCount =
          b.adjacent(rows, cols).where((n) => !visited!.contains(n)).length;
      if (aCount != bCount) return aCount.compareTo(bCount);
      // 3) desempate aleatorio
      return rng.nextInt(3) - 1;
    });

    for (final next in neighbors) {
      final res = _findHamiltonianPath(next, rows, cols, rng,
          targetEnd: targetEnd, visited: visited, path: path);
      if (res != null) return res;
    }

    // backtrack
    visited.remove(current);
    path.removeLast();
    return null;
  }
}
