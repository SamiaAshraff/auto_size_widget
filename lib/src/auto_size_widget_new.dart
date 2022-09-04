// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AutoSizeWidget extends StatefulWidget {
  const AutoSizeWidget(
      {Key? key,
      this.boxDecoration,
      this.borderColor,
      required this.initialHeight,
      required this.showIcon,
      required this.child,
      required this.initialWidth,
      required this.maxWidth,
      required this.maxHeight});

  final Widget child;
  final BoxDecoration? boxDecoration;
  final double initialHeight;
  final Color? borderColor;
  final double initialWidth;
  final bool showIcon;
  final double maxWidth;
  final double maxHeight;
  @override
  _AutoSizeWidgetState createState() => _AutoSizeWidgetState();
}

class _AutoSizeWidgetState extends State<AutoSizeWidget> {
  double height = 0;
  double width = 0;
  double maxWidth = 0;
  double maxHeight = 0;

  double top = 0;
  double left = 0;

  double startHeight = 0;
  double startWidth = 0;

  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > height
          ? newHeight <= maxHeight
              ? newHeight
              : maxHeight
          : height;
      width = newWidth > width
          ? newWidth <= maxWidth
              ? newWidth
              : maxWidth
          : width;
    });
  }

  @override
  void initState() {
    setState(() {
      height = widget.initialHeight;
      maxHeight = widget.maxHeight;
      maxWidth = widget.maxWidth;
      width = widget.initialWidth;
      startHeight = widget.initialHeight;
      startWidth = widget.initialWidth;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Positioned(
            top: top,
            left: left,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                    decoration: widget.boxDecoration ??
                        BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: widget.borderColor ?? Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                    height: height,
                    width: width,
                    child: widget.child),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ManipulatingBall(
              icon: widget.showIcon
                  ? Image.network(
                      'https://raw.githubusercontent.com/SamiaAshraff/auto_size_widget/main/marking.png',
                      height: 16,
                      width: 16,
                    )
                  : Container(
                      color: Colors.transparent,
                      width: 15,
                      height: 15,
                    ),
              onDrag: (dx, dy) {
                var mid = (dx + dy) / 2;

                var newHeight = height + 2 * mid;
                var newWidth = width + 2 * mid;

                setState(() {
                  startHeight = newHeight;
                  startWidth = newWidth;
                  height = newHeight > widget.initialHeight
                      ? newHeight <= maxHeight
                          ? newHeight
                          : maxHeight
                      : widget.initialHeight;
                  width = newWidth > widget.initialWidth
                      ? newWidth <= maxWidth
                          ? newWidth
                          : maxWidth
                      : widget.initialWidth;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  const ManipulatingBall({Key? key, required this.icon, required this.onDrag});

  final Function onDrag;
  final Widget icon;

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  double? initX;
  double? initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanStart: _handleDrag,
        onPanUpdate: _handleUpdate,
        child: widget.icon);
  }
}
