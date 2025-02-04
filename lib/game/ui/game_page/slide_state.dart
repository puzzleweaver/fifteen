import 'package:fifteen/board/domain/quad.dart';

class SlideState {
  final double value;
  final Quad q, r;

  SlideState({
    required this.value,
    required this.q,
    required this.r,
  });

  SlideState withValue(double newValue) => SlideState(
        value: newValue,
        q: q,
        r: r,
      );
}
