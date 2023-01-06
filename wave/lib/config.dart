import 'package:flutter/widgets.dart';

enum ColorMode {
  single,
  random,
  custom,
}

abstract class Config {
  final ColorMode? colorMode;

  Config({this.colorMode});

  static void throwNullError(String colorModeStr, String configStr) {
    throw FlutterError('When using `ColorMode.$colorModeStr`, `$configStr` must be set.');
  }
}

class CustomConfig extends Config {
  final List<Color>? colors;
  final List<List<Color>>? gradients;
  final Alignment? gradientBegin;
  final Alignment? gradientEnd;
  final List<int>? durations;
  final List<double>? heightPercentages;
  final MaskFilter? blur;

  CustomConfig({
    this.colors,
    this.gradients,
    this.gradientBegin,
    this.gradientEnd,
    required this.durations,
    required this.heightPercentages,
    this.blur,
  })  : assert(() {
          if (colors == null && gradients == null) {
            Config.throwNullError('custom', 'colors` or `gradients');
          }
          return true;
        }()),
        assert(() {
          if (gradients == null && (gradientBegin != null || gradientEnd != null)) {
            throw FlutterError('You set a gradient direction but forgot setting `gradients`.');
          }
          return true;
        }()),
        assert(() {
          if (durations == null) {
            Config.throwNullError('custom', 'durations');
          }
          return true;
        }()),
        assert(() {
          if (heightPercentages == null) {
            Config.throwNullError('custom', 'heightPercentages');
          }
          return true;
        }()),
        assert(() {
          if (colors != null && durations != null && heightPercentages != null) {
            if (colors.length != durations.length || colors.length != heightPercentages.length) {
              throw FlutterError('Length of `colors`, `durations` and `heightPercentages` must be equal.');
            }
          }
          return true;
        }()),
        assert(colors == null || gradients == null, 'Cannot provide both colors and gradients.'),
        super(colorMode: ColorMode.custom);
}

class RandomConfig extends Config {
  RandomConfig() : super(colorMode: ColorMode.random);
}

class SingleConfig extends Config {
  SingleConfig() : super(colorMode: ColorMode.single);
}
