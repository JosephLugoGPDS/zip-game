import 'package:app/core/gen/assets.gen.dart/assets.gen.dart';
import 'package:app/puzzle/data/model/level_model.dart';
import 'package:app/puzzle/presentation/bloc/game_cubit.dart';
import 'package:app/puzzle/presentation/bloc/game_state.dart';
import 'package:app/puzzle/presentation/widget/board_quiz_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BodyQuizApp extends StatefulWidget {
  final double size;
  const BodyQuizApp({required this.size, super.key});

  @override
  State<BodyQuizApp> createState() => _BodyQuizAppState();
}

class _BodyQuizAppState extends State<BodyQuizApp> {
  Offset? lastLocal;
  @override
  void initState() {
    super.initState();
  }

  OffsetInt _posFromLocal(Offset local, GameState game) {
    final cellSize = widget.size / game.level!.rows;
    final r = (local.dy / cellSize).clamp(0, game.level!.rows - 1).toInt();
    final c = (local.dx / cellSize).clamp(0, game.level!.cols - 1).toInt();
    return OffsetInt(r, c);
  }

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<GameCubit>();
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return state.gameActive.whenOrNull(
              data: (data) => GestureDetector(
                onPanStart: (details) {
                  final p = (context.findRenderObject() as RenderBox)
                      .globalToLocal(details.globalPosition);
                  final cell = _posFromLocal(p, state);

                  _cubit.startDraw(cell);
                },
                onPanUpdate: (details) {
                  final p = (context.findRenderObject() as RenderBox)
                      .globalToLocal(details.globalPosition);
                  final cell = _posFromLocal(p, state);
                  _cubit.moveDraw(cell);
                },
                onPanEnd: (_) {
                  _cubit.endDraw();
                },
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: BoardQuizApp(game: state),
                ),
              ),
            ) ??
            Center(
              child: SizedBox(
                height: 200.w,
                width: 200.w,
                child: Lottie.asset(
                  Assets.lottie.loader,
                  filterQuality: FilterQuality.high,
                ),
              ),
            );
      },
    );
  }
}
