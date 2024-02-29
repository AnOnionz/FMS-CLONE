import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import '/core/constant/colors.dart';

class WatermarkPainter extends CustomPainter {
  final String _text;
  final double _size; //this is pixel unit.
  final Color? _color;

  double get pictureW => _size * (_text.length);

  //this value can smaller.
  double get pictureH =>
      _size * 4; //there is 2 times _size due to text will around word-spacing.

  WatermarkPainter(this._text, this._size, {Color? color = AppColors.black})
      : _color = color;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final textStyle = ui.TextStyle(
      color: _color,
      fontSize: _size,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(_text);
    final constraints = ui.ParagraphConstraints(width: pictureW);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    const offset = Offset(0, 0);
    canvas.drawParagraph(paragraph, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  /// Returns a [ui.Picture] object.
  ui.Picture toPicture() {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    paint(canvas, Size(pictureW, pictureH));
    return recorder.endRecording();
  }

  /// Returns [ui.Image] object.
  Future<ui.Image> toImage(
      {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    return await toPicture().toImage(pictureW.toInt(), pictureH.toInt());
  }

  /// Returns image byte data.
  Future<ByteData?> toImageData(
      {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    final image = await toImage(format: format);
    return image.toByteData(format: format);
  }
}
