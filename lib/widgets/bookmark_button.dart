// ignore_for_file: must_be_immutable

library awesome_bookmark_icon_button;

import 'package:flutter/material.dart';

class BookMarkIconButton extends StatefulWidget {
  const BookMarkIconButton({
    Key? key,
    required this.onPressed,
    required this.isSaved,
    this.constraints,
    this.iconSize,
    required this.padding,
  }) : super(key: key);

  final Function onPressed;
  final int isSaved;
  final BoxConstraints? constraints;
  final double? iconSize;
  final EdgeInsetsGeometry padding;

  @override
  State<BookMarkIconButton> createState() => _BookMarkIconButtonState();
}

class _BookMarkIconButtonState extends State<BookMarkIconButton> {
  bool isSaved = false;

  @override
  void initState() {
    if (widget.isSaved == 1) {
      setState(() => isSaved = true);
    } else {
      setState(() => isSaved = false);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.iconSize,
      padding: widget.padding,
      onPressed: () {
        setState(
          () {
            isSaved = !isSaved;
          },
        );
        widget.onPressed;
      },
      icon: isSaved
          ? const Icon(
              Icons.bookmark,
              color: Colors.white,
            )
          : const Icon(
              Icons.bookmark_outline_rounded,
              color: Colors.white,
            ),
    );
  }
}

class BookMarkButton extends StatefulWidget {
  bool value;
  final Function() onPressed;
  BookMarkButton(this.value, {super.key, required this.onPressed});

  @override
  State<BookMarkButton> createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => widget.value = !widget.value);
        widget.onPressed.call();
      },
      icon: widget.value
          ? const Icon(
              Icons.bookmark,
              color: Colors.white,
            )
          : const Icon(
              Icons.bookmark_outline_outlined,
              color: Colors.white,
            ),
    );
  }
}
