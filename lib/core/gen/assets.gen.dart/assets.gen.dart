/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow-back.svg
  SvgGenImage get arrowBack =>
      const SvgGenImage('assets/images/arrow-back.svg');

  /// File path: assets/images/arrow.svg
  SvgGenImage get arrow => const SvgGenImage('assets/images/arrow.svg');

  /// File path: assets/images/arrow2.svg
  SvgGenImage get arrow2 => const SvgGenImage('assets/images/arrow2.svg');

  /// File path: assets/images/branch.svg
  SvgGenImage get branch => const SvgGenImage('assets/images/branch.svg');

  /// File path: assets/images/clock.svg
  SvgGenImage get clock => const SvgGenImage('assets/images/clock.svg');

  /// File path: assets/images/cross.svg
  SvgGenImage get cross => const SvgGenImage('assets/images/cross.svg');

  /// File path: assets/images/crown.svg
  SvgGenImage get crown => const SvgGenImage('assets/images/crown.svg');

  /// File path: assets/images/dice.svg
  SvgGenImage get dice => const SvgGenImage('assets/images/dice.svg');

  /// File path: assets/images/hint.svg
  SvgGenImage get hint => const SvgGenImage('assets/images/hint.svg');

  /// File path: assets/images/hourglass.svg
  SvgGenImage get hourglass => const SvgGenImage('assets/images/hourglass.svg');

  /// File path: assets/images/ic_close.svg
  SvgGenImage get icClose => const SvgGenImage('assets/images/ic_close.svg');

  /// File path: assets/images/info.svg
  SvgGenImage get info => const SvgGenImage('assets/images/info.svg');

  /// File path: assets/images/puzzle-piece.svg
  SvgGenImage get puzzlePiece =>
      const SvgGenImage('assets/images/puzzle-piece.svg');

  /// File path: assets/images/puzzle.svg
  SvgGenImage get puzzle => const SvgGenImage('assets/images/puzzle.svg');

  /// File path: assets/images/refresh.svg
  SvgGenImage get refresh => const SvgGenImage('assets/images/refresh.svg');

  /// File path: assets/images/reload.svg
  SvgGenImage get reload => const SvgGenImage('assets/images/reload.svg');

  /// File path: assets/images/research.svg
  SvgGenImage get research => const SvgGenImage('assets/images/research.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowBack,
        arrow,
        arrow2,
        branch,
        clock,
        cross,
        crown,
        dice,
        hint,
        hourglass,
        icClose,
        info,
        puzzlePiece,
        puzzle,
        refresh,
        reload,
        research
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/confetti.json
  String get confetti => 'assets/lottie/confetti.json';

  /// File path: assets/lottie/loader.json
  String get loader => 'assets/lottie/loader.json';

  /// List of all assets
  List<String> get values => [confetti, loader];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
