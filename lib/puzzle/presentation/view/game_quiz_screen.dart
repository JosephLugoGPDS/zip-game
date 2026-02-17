import 'dart:math';

import 'package:app/core/bloc/result_state.dart';
import 'package:app/core/extensions/context_extension.dart';
import 'package:app/core/gen/assets.gen.dart/assets.gen.dart';
import 'package:app/core/resources/colors.dart';
import 'package:app/core/widgets/buttons/theme_flat_button.dart';
import 'package:app/core/widgets/dialog/completed_dialog.dart';
import 'package:app/puzzle/data/model/level_model.dart';
import 'package:app/puzzle/presentation/bloc/game_cubit.dart';
import 'package:app/puzzle/presentation/bloc/game_state.dart';
import 'package:app/puzzle/presentation/bloc/level_generator_cubit.dart';
import 'package:app/puzzle/presentation/bloc/timer_cubit.dart';
import 'package:app/puzzle/presentation/widget/body_quiz_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameQuizScreen extends StatefulWidget {
  const GameQuizScreen({super.key});
  @override
  State<GameQuizScreen> createState() => _GameQuizScreenState();
}

class _GameQuizScreenState extends State<GameQuizScreen> {
  late LevelGeneratorCubit _generator;
  late GameCubit _cubit;
  late CompletedDialog _dialog;
  @override
  void initState() {
    super.initState();
    _generator = context.read<LevelGeneratorCubit>();
    _cubit = context.read<GameCubit>();
    _dialog = CompletedDialog(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generator.generateLevel(rows: 6, cols: 6, numbers: 10);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final boardSize = min(size.width, size.height - 120.h);
    return MultiBlocListener(
      listeners: [
        BlocListener<LevelGeneratorCubit, ResultState<Level>>(
          listener: (context, state) {
            state.whenOrNull(
              data: (data) {
                context.read<TimerCubit>().start();
                _cubit.loadLevel(data);
              },
            );
          },
        ),
        BlocListener<GameCubit, GameState>(
          listener: (context, state) {
            state.gameCompleted.whenOrNull(
              data: (data) {
                _dialog.show();
                context.read<TimerCubit>().reset();
                _generator.generateLevel(rows: 6, cols: 6, numbers: 10);
                _cubit.resetGame();
              },
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.whiteColor.withOpacity(1),
        body: Column(
          children: [
            SizedBox(height: 10.h + context.paddingTop),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<TimerCubit, String>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Assets.images.clock.svg(height: 24.h, width: 24.h),
                          SizedBox(width: 10.w),
                          Text(state,
                              style: context.textTheme.titleLarge?.copyWith(
                                  color: AppColors.buttonDisableColor)),
                        ],
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<TimerCubit>().reset();
                      _generator.generateLevel(rows: 6, cols: 6, numbers: 10);
                      _cubit.resetGame();
                    },
                    child: Assets.images.refresh.svg(
                      height: 32.h,
                      width: 32.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                width: boardSize,
                height: boardSize,
                child: BodyQuizApp(
                  size: boardSize,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.images.branch.svg(height: 58.h, width: 58.h),
                Assets.images.research.svg(height: 58.h, width: 58.h),
              ],
            ),
            BlocBuilder<GameCubit, GameState>(builder: (context, state) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
                child: Column(
                  children: [
                    Text('Estado: ${state.gameStatus.name}'),
                  ],
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ThemeFlatButton(
                  backgroundColor: AppColors.pinkEdu,
                  width: 140.w,
                  text: 'HINT',
                  onPressed: () {
                    debugPrint('HINT button pressed');
                    // TODO: Implement hint functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                      content: Text('Hint functionality coming soon!',  
                      style: TextStyle(
                      color: AppColors.whiteColor
                      ),
                      ),
                      backgroundColor: AppColors.pinkEdu,
                    ),
                    );
                  },
                ),
                ThemeFlatButton(
                  backgroundColor: AppColors.greenEdu,
                  text: 'UNDO',
                  width: 140.w,
                  onPressed: () {
                    debugPrint('UNDO button pressed');
                    _cubit.undo();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
