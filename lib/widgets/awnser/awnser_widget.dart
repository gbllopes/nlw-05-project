import 'package:flutter/material.dart';

import 'package:quiz_flutter_app/core/app_colors.dart';
import 'package:quiz_flutter_app/core/core.dart';

class AwnserWidget extends StatefulWidget {
  final String awnser;
  final bool isRight;
  final bool isSelected;
  final bool isConfirmed;
  final int indexAwnser;
  final int? indexSelectedAwnser;
  final VoidCallback onTap;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    required this.isRight,
    this.isSelected = false,
    required this.isConfirmed,
    required this.indexAwnser,
    required this.indexSelectedAwnser,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AwnserWidget> createState() => _AwnserWidgetState();
}

class _AwnserWidgetState extends State<AwnserWidget> {
  Color get _selectedColorRight =>
      widget.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      widget.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      widget.isRight ? AppColors.lightGreen : AppColors.lightRed;

  TextStyle get _selectedTextStyleRight =>
      widget.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => widget.isRight ? Icons.check : Icons.close;

  Map _verifySelection() {
    if (widget.isSelected && widget.isConfirmed) {
      return {
        "colorBackgroud": _selectedColorCardRight,
        "colorText": _selectedTextStyleRight,
        "colorBorder": _selectedBorderRight,
        "backgroudColorIcon": _selectedColorRight
      };
    }

    if (widget.isSelected && !widget.isConfirmed) {
      if (widget.indexSelectedAwnser == widget.indexAwnser) {
        return {
          "colorBackgroud": AppColors.lightBlue,
          "colorText": AppTextStyles.body,
          "colorBorder": AppColors.lightBlue,
          "backgroudColorIcon": AppColors.grey
        };
      }
    }
    return {
      "colorBackgroud": AppColors.white,
      "colorText": AppTextStyles.body,
      "colorBorder": AppColors.border,
      "backgroudColorIcon": AppColors.white,
    };
  }

  @override
  Widget build(BuildContext context) {
    final _color = _verifySelection();

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
              color: _color['colorBackgroud'],
              border: Border.fromBorderSide(
                  BorderSide(color: _color['colorBorder'])),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(widget.awnser, style: _color['colorText'])),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                          BorderSide(color: _color['colorBorder'])),
                      borderRadius: BorderRadius.circular(500),
                      color: _color['backgroudColorIcon']),
                  child: widget.isConfirmed
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
