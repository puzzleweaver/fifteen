import 'package:fifteen/board/domain/coord.dart';
import 'package:fifteen/board/domain/double_point.dart';
import 'package:fifteen/board/domain/int_point.dart';
import 'package:fifteen/game/ui/game_page/gameplay_state.dart';
import 'package:fifteen/game/ui/game_page/slide_state.dart';
import 'package:fifteen/level/ui/level_renderer.dart';
import 'package:fifteen/board/domain/quad.dart';
import 'package:fifteen/app/ui/custom_canvas.dart';
import 'package:flutter/material.dart';

class GameWidgetPainter extends FifteenPainter {
  final GameplayState gameplayState;
  final SlideState slideState;

  GameWidgetPainter({
    required this.gameplayState,
    required this.slideState,
    required super.shader,
    required super.image,
  });

  get board => gameplayState.board;
  get game => gameplayState.game;

  @override
  void paint(Canvas canvas, Size size) {
    LevelRenderer renderer = LevelRenderer(
      canvas: canvas,
      size: size,
      shader: shader,
      image: image,
    );

    // background
    renderer.drawQuadWithShader(
      from: Quad.unit(),
      to: Quad.unit(),
      shape: Quad.unit(),
    );

    List<Quad> quads = board.subquads;

    // rounded outline
    renderer.setStroke(color: Colors.black, strokeWidth: 5);
    // for (Quad quad in quads) {
    //   renderer.drawQuad(quad, renderer.strokePaint);
    // }
    renderer.drawSubquadOutlines(board);

    renderer.setFill(color: Colors.black);
    for (int i = 0; i < quads.length; i++) {
      Quad q = quads[i], from, to;
      from = q;
      to = game.getQuad(quads, i);
      if (game.isSpace(i)) {
        renderer.drawQuad(q, renderer.fillPaint);
      } else {
        renderer.drawQuadWithShader(from: from, to: to, shape: q);
      }
    }

    // draw subquad divisions
    renderer.setStroke(strokeWidth: 0.5);
    renderer.drawSubquadOutlines(board);

    drawGoodAnimation(renderer);
  }

  void drawGoodAnimation(LevelRenderer renderer) {
    List<Quad> quads = board.subquads;
    // slide animation
    final animationStuff = gameplayState.getAnimationStuff();
    if (animationStuff == null || slideState.value == 1.0) return;

    // indices of the two squares we're thinking about
    Coord spaceIs = animationStuff.$1.coord;
    Coord spaceWas = animationStuff.$2.coord;

    IntPoint dirIs = animationStuff.$1.dir;
    IntPoint dirWas = animationStuff.$2.dir;
    IntPoint dirImg = dirIs;
    IntPoint dirImg2 = dirWas * IntPoint.down;

    Quad quadImg = gameplayState.game
        .getQuad(quads, board.getIndex(spaceWas))
        .rel(dirIs.inv())
        .rel(dirWas)
        .rel(IntPoint.down);
    Quad quadImg2 = gameplayState.game.getQuad(quads, board.getIndex(spaceWas));
    Quad quadIs = board.getQuad(spaceIs);
    Quad quadWas = board.getQuad(spaceWas);

    // fill the transitional squares black
    renderer.setFill(color: Colors.black);
    renderer.drawQuad(quadIs, renderer.fillPaint);
    renderer.drawQuad(quadWas, renderer.fillPaint);

    DoublePoint pLerp(Quad quad, IntPoint dir, double t, double x, double y) =>
        quad.interiorLerp(x + t * dir.x / 2, y + t * dir.y / 2);
    Quad getAQuad(Quad quad, IntPoint dir, double t) => Quad(
          pLerp(quad, dir, t, 0, 0),
          pLerp(quad, dir, t, 0, 1),
          pLerp(quad, dir, t, 1, 1),
          pLerp(quad, dir, t, 1, 0),
        );
    Quad transQuadWas = getAQuad(quadWas, dirWas, 1 - slideState.value);
    Quad transQuadImg = getAQuad(quadImg, dirImg, 1 - slideState.value);
    Quad transQuadImg2 = getAQuad(quadImg2, dirImg2, 1 - slideState.value);

    Quad a = Quad(
      quadImg.rel(dirImg).p1,
      transQuadImg.rel(dirImg).p1,
      transQuadImg.rel(dirImg).p4,
      quadImg.rel(dirImg).p4,
    ).rel(dirImg.inv());
    Quad b = Quad(
      transQuadImg2.rel(dirImg2).p1,
      quadImg2.rel(dirImg2).p2,
      quadImg2.rel(dirImg2).p3,
      transQuadImg2.rel(dirImg2).p4,
    ).rel(dirImg2.inv());

    Quad aPrimeQuad = getAQuad(quadIs, dirIs, slideState.value);
    Quad aPrime = Quad(
      aPrimeQuad.rel(dirIs).p1,
      quadIs.rel(dirIs).p2,
      quadIs.rel(dirIs).p3,
      aPrimeQuad.rel(dirIs).p4,
    ).rel(dirIs.inv());
    Quad bPrime = Quad(
      transQuadWas.rel(dirWas).p1,
      quadWas.rel(dirWas).p2,
      quadWas.rel(dirWas).p3,
      transQuadWas.rel(dirWas).p4,
    ).rel(dirWas.inv());

    // debuggy quads
    // renderer.setFill(color: Colors.red.withAlpha(100));
    // renderer.drawQuad(aPrime, renderer.fillPaint);
    // renderer.setFill(color: Colors.green.withAlpha(100));
    // renderer.drawQuad(bPrime, renderer.fillPaint);

    // renderer.setFill(color: Colors.orange.withAlpha(100));
    // renderer.drawQuad(a, renderer.fillPaint);
    // renderer.setFill(color: Colors.blue.withAlpha(100));
    // renderer.drawQuad(b, renderer.fillPaint);

    renderer.drawQuadWithShader(
      from: aPrime,
      to: a,
      shape: aPrime,
    );
    renderer.drawQuadWithShader(
      from: bPrime,
      to: b,
      shape: bPrime,
    );
  }

  void drawBadAnimation(LevelRenderer renderer) {
    List<Quad> quads = board.subquads;
    // slide animation
    final animationStuff = gameplayState.getAnimationStuff();
    if (animationStuff != null) {
      // indices of the two squares we're thinking about
      Coord spaceIs = animationStuff.$1.coord;
      Coord spaceWas = animationStuff.$2.coord;
      IntPoint dirIs = animationStuff.$1.dir;
      IntPoint dirWas = animationStuff.$2.dir;

      Quad quadIs = board.getQuad(spaceIs), quadWas = board.getQuad(spaceWas);

      // fill the transitional squares black
      renderer.setFill(color: Colors.black);
      renderer.drawQuad(quadIs, renderer.fillPaint);
      renderer.drawQuad(quadWas, renderer.fillPaint);

      DoublePoint isLerp(int x, int y) => quadIs.interiorLerp(
            x + slideState.value * dirIs.x / 2,
            y + slideState.value * dirIs.y / 2,
          );
      Quad transQuadIs = Quad(
        isLerp(0, 0),
        isLerp(0, 1),
        isLerp(1, 1),
        isLerp(1, 0),
      );
      IntPoint shapeIsDir = dirIs;
      Quad shapeIs = Quad(
        transQuadIs.rel(shapeIsDir).p1,
        quadIs.rel(shapeIsDir).p2,
        quadIs.rel(shapeIsDir).p3,
        transQuadIs.rel(shapeIsDir).p4,
      ).rel(shapeIsDir.inv());
      renderer.drawQuadWithShader(
        from: transQuadIs,
        to: gameplayState.previousGame.getQuad(quads, board.getIndex(spaceIs)),
        shape: shapeIs,
      );

      DoublePoint wasLerp(int x, int y) => quadWas.interiorLerp(
            x + (1 - slideState.value) * dirWas.x / 2,
            y + (1 - slideState.value) * dirWas.y / 2,
          );
      Quad transQuadWas = Quad(
        wasLerp(0, 0),
        wasLerp(0, 1),
        wasLerp(1, 1),
        wasLerp(1, 0),
      );
      IntPoint shapeWasDir = dirWas;
      Quad shapeWas = Quad(
        transQuadWas.rel(shapeWasDir).p1,
        quadWas.rel(shapeWasDir).p2,
        quadWas.rel(shapeWasDir).p3,
        transQuadWas.rel(shapeWasDir).p4,
      ).rel(shapeWasDir.inv());
      renderer.drawQuadWithShader(
        from: transQuadWas,
        to: gameplayState.game.getQuad(quads, board.getIndex(spaceWas)),
        shape: shapeWas,
      );
      renderer.drawQuadWithShader(
        from: transQuadWas,
        to: gameplayState.game.getQuad(quads, board.getIndex(spaceWas)),
        shape: shapeWas,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
