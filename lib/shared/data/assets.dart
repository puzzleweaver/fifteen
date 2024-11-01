import 'dart:math';

class Assets {
  static String randomImage() {
    return images[Random().nextInt(images.length)];
  }

  static final images = [
    "assets/images/photos/animal.jpg",
    "assets/images/photos/avenue.jpg",
    "assets/images/photos/beach.jpg",
    "assets/images/photos/beach2.jpg",
    "assets/images/photos/bee.jpg",
    "assets/images/photos/cat.jpg",
    "assets/images/photos/cat2.jpg",
    "assets/images/photos/cat3.jpg",
    "assets/images/photos/cat4.jpg",
    "assets/images/photos/cat5.jpg",
    "assets/images/photos/cat6.jpg",
    "assets/images/photos/chipmunk.jpg",
    "assets/images/photos/chipmunk2.jpg",
    "assets/images/photos/dahlia.jpg",
    "assets/images/photos/dahlia2.jpg",
    "assets/images/photos/desert.jpg",
    "assets/images/photos/drop.jpg",
    "assets/images/photos/eurasian-squirrel.jpg",
    "assets/images/photos/field.jpg",
    "assets/images/photos/flower.jpg",
    "assets/images/photos/mean-leash.jpg",
    "assets/images/photos/milky-way.jpg",
    "assets/images/photos/moon.jpg",
    "assets/images/photos/mountains.jpg",
    "assets/images/photos/muskrat.jpg",
    "assets/images/photos/nature.jpg",
    "assets/images/photos/plaid.jpg",
    "assets/images/photos/rat.jpg",
    "assets/images/photos/rat1.jpg",
    "assets/images/photos/rat2.jpg",
    "assets/images/photos/squirrel.jpg",
    "assets/images/photos/squirrel2.jpg",
    "assets/images/photos/straw-flower.jpg",
    "assets/images/photos/wave.jpg",
  ];

  static final boards = [
    "assets/boards/4-example.json",
    "assets/boards/5-trivial.json",
    "assets/boards/5-frame.json",
    "assets/boards/7-less-trivial.json",
    "assets/boards/8-square.json",
    "assets/boards/9-classic.json",
    "assets/boards/9-cubeception.json",
    "assets/boards/9-cubes-hard.json",
    "assets/boards/9-cubes-trivial.json",
    "assets/boards/10-pentagon.json",
    "assets/boards/12-hexagon.json",
    "assets/boards/12-medium-cube.json",
    "assets/boards/12-flipped-medium-cube.json",
    "assets/boards/12-square-hard.json",
    "assets/boards/12-squareception.json",
    "assets/boards/12-two-rings.json",
    "assets/boards/16-classic.json",
  ];

  static final boardsById = {
    "030c3ec1-9804-11ef-8f22-9947761f2d81": "assets/boards/4-example.json",
    "69a25a01-9883-11ef-9e82-23e5f28a305b": "assets/boards/5-frame.json",
    "7d111c31-9800-11ef-b1e1-49612c63f05a": "assets/boards/5-trivial.json",
    "6b77d761-9801-11ef-b1e1-49612c63f05a": "assets/boards/7-less-trivial.json",
    // TODO fill in the rest.
  };
}
