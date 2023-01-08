import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({Key? key, this.text, this.callback})
      : super(key: key);
  final String? text;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: SizeConfig.screenWidth,
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          text ?? "Next",
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
