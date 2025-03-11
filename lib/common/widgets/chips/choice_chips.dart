import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class QCChoiceChips extends StatelessWidget {
  const QCChoiceChips({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = QCHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? QCColors.white : null),
        avatar:
            isColor
                ? QCCircularContainer(
                  height: 50,
                  width: 50,
                  backgroundColor: QCHelperFunctions.getColor(text)!,
                )
                : null,
        shape: isColor ? CircleBorder() : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        backgroundColor: isColor ? QCHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
