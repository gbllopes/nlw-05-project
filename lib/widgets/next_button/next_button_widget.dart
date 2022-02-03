import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_flutter_app/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback acao;
  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.acao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: label == 'Confirmar' || label == 'Avançar'
              ? AppColors.darkGreen
              : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: AppColors.border))),
      child: TextButton(
        onPressed: acao,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: label == 'Confirmar' || label == 'Avançar'
                ? AppColors.white
                : AppColors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
