import 'package:flutter/material.dart';
import 'package:musicapp/core/theme/color_pallete.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;

  const AuthButton({
    super.key,
    required this.label,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [ColorPallete.gradinet1, ColorPallete.gradinet2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),

      child:isLoading ?CircularProgressIndicator() : ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: ColorPallete.transaprenrColor,
          shadowColor: ColorPallete.transaprenrColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),

        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(Colors.blue),
        //   padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 16)),
        //   shape: MaterialStateProperty.all(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        // )
      ),
    );
  }
}
