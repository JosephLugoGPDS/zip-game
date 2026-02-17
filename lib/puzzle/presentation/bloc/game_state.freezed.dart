// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  ResultState<bool> get gameActive => throw _privateConstructorUsedError;
  ResultState<bool> get gameCompleted => throw _privateConstructorUsedError;
  GameStatus get gameStatus => throw _privateConstructorUsedError;
  Level? get level => throw _privateConstructorUsedError;
  bool get startPlaying => throw _privateConstructorUsedError; //Current path
  List<OffsetInt> get permanentPath => throw _privateConstructorUsedError;
  List<List<OffsetInt>> get history =>
      throw _privateConstructorUsedError; // Cuando el usuario dibuja:
  List<OffsetInt> get currentDraw =>
      throw _privateConstructorUsedError; // Solución como mapa cell->index en path
  Map<OffsetInt, int> get solutionIndex =>
      throw _privateConstructorUsedError; // número actual a conectar (se empieza en 1)
  int get currentNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {ResultState<bool> gameActive,
      ResultState<bool> gameCompleted,
      GameStatus gameStatus,
      Level? level,
      bool startPlaying,
      List<OffsetInt> permanentPath,
      List<List<OffsetInt>> history,
      List<OffsetInt> currentDraw,
      Map<OffsetInt, int> solutionIndex,
      int currentNumber});

  $ResultStateCopyWith<bool, $Res> get gameActive;
  $ResultStateCopyWith<bool, $Res> get gameCompleted;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameActive = null,
    Object? gameCompleted = null,
    Object? gameStatus = null,
    Object? level = freezed,
    Object? startPlaying = null,
    Object? permanentPath = null,
    Object? history = null,
    Object? currentDraw = null,
    Object? solutionIndex = null,
    Object? currentNumber = null,
  }) {
    return _then(_value.copyWith(
      gameActive: null == gameActive
          ? _value.gameActive
          : gameActive // ignore: cast_nullable_to_non_nullable
              as ResultState<bool>,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as ResultState<bool>,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level?,
      startPlaying: null == startPlaying
          ? _value.startPlaying
          : startPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      permanentPath: null == permanentPath
          ? _value.permanentPath
          : permanentPath // ignore: cast_nullable_to_non_nullable
              as List<OffsetInt>,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<List<OffsetInt>>,
      currentDraw: null == currentDraw
          ? _value.currentDraw
          : currentDraw // ignore: cast_nullable_to_non_nullable
              as List<OffsetInt>,
      solutionIndex: null == solutionIndex
          ? _value.solutionIndex
          : solutionIndex // ignore: cast_nullable_to_non_nullable
              as Map<OffsetInt, int>,
      currentNumber: null == currentNumber
          ? _value.currentNumber
          : currentNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultStateCopyWith<bool, $Res> get gameActive {
    return $ResultStateCopyWith<bool, $Res>(_value.gameActive, (value) {
      return _then(_value.copyWith(gameActive: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultStateCopyWith<bool, $Res> get gameCompleted {
    return $ResultStateCopyWith<bool, $Res>(_value.gameCompleted, (value) {
      return _then(_value.copyWith(gameCompleted: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResultState<bool> gameActive,
      ResultState<bool> gameCompleted,
      GameStatus gameStatus,
      Level? level,
      bool startPlaying,
      List<OffsetInt> permanentPath,
      List<List<OffsetInt>> history,
      List<OffsetInt> currentDraw,
      Map<OffsetInt, int> solutionIndex,
      int currentNumber});

  @override
  $ResultStateCopyWith<bool, $Res> get gameActive;
  @override
  $ResultStateCopyWith<bool, $Res> get gameCompleted;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameActive = null,
    Object? gameCompleted = null,
    Object? gameStatus = null,
    Object? level = freezed,
    Object? startPlaying = null,
    Object? permanentPath = null,
    Object? history = null,
    Object? currentDraw = null,
    Object? solutionIndex = null,
    Object? currentNumber = null,
  }) {
    return _then(_$GameStateImpl(
      gameActive: null == gameActive
          ? _value.gameActive
          : gameActive // ignore: cast_nullable_to_non_nullable
              as ResultState<bool>,
      gameCompleted: null == gameCompleted
          ? _value.gameCompleted
          : gameCompleted // ignore: cast_nullable_to_non_nullable
              as ResultState<bool>,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as Level?,
      startPlaying: null == startPlaying
          ? _value.startPlaying
          : startPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      permanentPath: null == permanentPath
          ? _value._permanentPath
          : permanentPath // ignore: cast_nullable_to_non_nullable
              as List<OffsetInt>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<List<OffsetInt>>,
      currentDraw: null == currentDraw
          ? _value._currentDraw
          : currentDraw // ignore: cast_nullable_to_non_nullable
              as List<OffsetInt>,
      solutionIndex: null == solutionIndex
          ? _value._solutionIndex
          : solutionIndex // ignore: cast_nullable_to_non_nullable
              as Map<OffsetInt, int>,
      currentNumber: null == currentNumber
          ? _value.currentNumber
          : currentNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GameStateImpl extends _GameState {
  _$GameStateImpl(
      {this.gameActive = const Initial(),
      this.gameCompleted = const Initial(),
      this.gameStatus = GameStatus.idle,
      this.level,
      this.startPlaying = false,
      final List<OffsetInt> permanentPath = const [],
      final List<List<OffsetInt>> history = const [],
      final List<OffsetInt> currentDraw = const [],
      final Map<OffsetInt, int> solutionIndex = const {},
      this.currentNumber = 1})
      : _permanentPath = permanentPath,
        _history = history,
        _currentDraw = currentDraw,
        _solutionIndex = solutionIndex,
        super._();

  @override
  @JsonKey()
  final ResultState<bool> gameActive;
  @override
  @JsonKey()
  final ResultState<bool> gameCompleted;
  @override
  @JsonKey()
  final GameStatus gameStatus;
  @override
  final Level? level;
  @override
  @JsonKey()
  final bool startPlaying;
//Current path
  final List<OffsetInt> _permanentPath;
//Current path
  @override
  @JsonKey()
  List<OffsetInt> get permanentPath {
    if (_permanentPath is EqualUnmodifiableListView) return _permanentPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permanentPath);
  }

  final List<List<OffsetInt>> _history;
  @override
  @JsonKey()
  List<List<OffsetInt>> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

// Cuando el usuario dibuja:
  final List<OffsetInt> _currentDraw;
// Cuando el usuario dibuja:
  @override
  @JsonKey()
  List<OffsetInt> get currentDraw {
    if (_currentDraw is EqualUnmodifiableListView) return _currentDraw;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentDraw);
  }

// Solución como mapa cell->index en path
  final Map<OffsetInt, int> _solutionIndex;
// Solución como mapa cell->index en path
  @override
  @JsonKey()
  Map<OffsetInt, int> get solutionIndex {
    if (_solutionIndex is EqualUnmodifiableMapView) return _solutionIndex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_solutionIndex);
  }

// número actual a conectar (se empieza en 1)
  @override
  @JsonKey()
  final int currentNumber;

  @override
  String toString() {
    return 'GameState(gameActive: $gameActive, gameCompleted: $gameCompleted, gameStatus: $gameStatus, level: $level, startPlaying: $startPlaying, permanentPath: $permanentPath, history: $history, currentDraw: $currentDraw, solutionIndex: $solutionIndex, currentNumber: $currentNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.gameActive, gameActive) ||
                other.gameActive == gameActive) &&
            (identical(other.gameCompleted, gameCompleted) ||
                other.gameCompleted == gameCompleted) &&
            (identical(other.gameStatus, gameStatus) ||
                other.gameStatus == gameStatus) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.startPlaying, startPlaying) ||
                other.startPlaying == startPlaying) &&
            const DeepCollectionEquality()
                .equals(other._permanentPath, _permanentPath) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality()
                .equals(other._currentDraw, _currentDraw) &&
            const DeepCollectionEquality()
                .equals(other._solutionIndex, _solutionIndex) &&
            (identical(other.currentNumber, currentNumber) ||
                other.currentNumber == currentNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameActive,
      gameCompleted,
      gameStatus,
      level,
      startPlaying,
      const DeepCollectionEquality().hash(_permanentPath),
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(_currentDraw),
      const DeepCollectionEquality().hash(_solutionIndex),
      currentNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState extends GameState {
  factory _GameState(
      {final ResultState<bool> gameActive,
      final ResultState<bool> gameCompleted,
      final GameStatus gameStatus,
      final Level? level,
      final bool startPlaying,
      final List<OffsetInt> permanentPath,
      final List<List<OffsetInt>> history,
      final List<OffsetInt> currentDraw,
      final Map<OffsetInt, int> solutionIndex,
      final int currentNumber}) = _$GameStateImpl;
  _GameState._() : super._();

  @override
  ResultState<bool> get gameActive;
  @override
  ResultState<bool> get gameCompleted;
  @override
  GameStatus get gameStatus;
  @override
  Level? get level;
  @override
  bool get startPlaying;
  @override //Current path
  List<OffsetInt> get permanentPath;
  @override
  List<List<OffsetInt>> get history;
  @override // Cuando el usuario dibuja:
  List<OffsetInt> get currentDraw;
  @override // Solución como mapa cell->index en path
  Map<OffsetInt, int> get solutionIndex;
  @override // número actual a conectar (se empieza en 1)
  int get currentNumber;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
