import 'package:flutter/material.dart';

class costumButton extends StatelessWidget {
  final Color bckClr;
  final Color txtClr;
  final String btnTxt;
  final VoidCallback OnClick;

  const costumButton({
    Key? key,
    required this.bckClr,
    required this.btnTxt,
    required this.OnClick,
    required this.txtClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnClick,
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bckClr,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          btnTxt,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: txtClr),
        ),
      ),
    );
  }
}
