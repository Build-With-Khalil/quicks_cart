import 'package:flutter/material.dart';

class QCProductTitleText extends StatelessWidget {
  const QCProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: smallSize
          ? Theme.of(context).textTheme.bodyMedium
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
