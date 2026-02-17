import 'dart:math';

import 'package:app/core/resources/colors.dart';
import 'package:app/puzzle/presentation/bloc/game_state.dart';
import 'package:flutter/material.dart';

class BoardQuizApp extends CustomPainter {
  final GameState game;
  BoardQuizApp({required this.game});

  @override
  void paint(Canvas canvas, Size size) {
    // Dentro de paint(Canvas canvas, Size size)

    final rows = game.level!.rows;
    final cols = game.level!.cols;
    final cellW = size.width / cols;
    final cellH = size.height / rows;
    final paintGrid = Paint()..color = Colors.grey.shade300;

// Fondo general blanco
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, Paint()..color = Colors.white);

// 🔹 1. Dibujar todos los cuadrados redondeados gris claro como base
    final baseCellPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final cr = Rect.fromLTWH(
          c * cellW + 4,
          r * cellH + 4,
          cellW - 8,
          cellH - 8,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(cr, const Radius.circular(8)),
          baseCellPaint,
        );
      }
    }

// 🔹 2. Líneas de la grilla (opcional)
    for (int r = 0; r <= rows; r++) {
      final y = r * cellH;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paintGrid);
    }
    for (int c = 0; c <= cols; c++) {
      final x = c * cellW;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paintGrid);
    }

// 🔹 3. Dibujar solución (si está activa)
    // final showSolution = false;
    // if (showSolution) {
    //   final solPaint = Paint()
    //     ..color = Colors.green.withOpacity(0.15)
    //     ..style = PaintingStyle.fill;
    //   for (final cell in level.solutionPath) {
    //     final r = cell.r, c = cell.c;
    //     final cr = Rect.fromLTWH(
    //       c * cellW + 4,
    //       r * cellH + 4,
    //       cellW - 8,
    //       cellH - 8,
    //     );
    //     canvas.drawRRect(
    //       RRect.fromRectAndRadius(cr, const Radius.circular(8)),
    //       solPaint,
    //     );
    //   }
    // }

    //v3
    // === PermanentPath con degradado ===
    if (game.permanentPath.isNotEmpty) {
      final points = game.permanentPath.map((cell) {
        final dx = cell.c * cellW + cellW / 2;
        final dy = cell.r * cellH + cellH / 2;
        return Offset(dx, dy);
      }).toList();

      final permanentPaint = Paint()
        ..shader = LinearGradient(
          colors: [
            AppColors.greenEdu.withOpacity(0.9),
            AppColors.greenEdu.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromPoints(points.first, points.last))
        ..style = PaintingStyle.stroke
        ..strokeWidth = min(cellW, cellH) * 0.6
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      canvas.drawPath(path, permanentPaint);
    }

// === CurrentDraw con degradado más vivo ===
    if (game.currentDraw.isNotEmpty) {
      final points = game.currentDraw.map((cell) {
        final dx = cell.c * cellW + cellW / 2;
        final dy = cell.r * cellH + cellH / 2;
        return Offset(dx, dy);
      }).toList();
      final currentPaint = Paint()
        ..shader = LinearGradient(
          colors: [
            AppColors.greenEdu,
            AppColors.greenEdu.withOpacity(0.4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(Rect.fromPoints(points.first, points.last))
        ..style = PaintingStyle.stroke
        ..strokeWidth = min(cellW, cellH) * 0.6
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;
      final path = Path()..moveTo(points.first.dx, points.first.dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      canvas.drawPath(path, currentPaint);
    }

// 🔹 5. Dibujar números encima
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (final entry in game.level!.numberPositions.entries) {
      final num = entry.key;
      final cell = entry.value;
      final center = Offset(
        cell.c * cellW + cellW / 2,
        cell.r * cellH + cellH / 2,
      );
      final circlePaint = Paint()..color = Colors.black;
      canvas.drawCircle(center, min(cellW, cellH) * 0.33, circlePaint);
      textPainter.text = TextSpan(
        text: '$num',
        style: TextStyle(
          color: Colors.white,
          fontSize: min(cellW, cellH) * 0.33,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        center - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
