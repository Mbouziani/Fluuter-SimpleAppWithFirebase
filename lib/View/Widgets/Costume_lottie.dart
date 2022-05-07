import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class mylotitie extends StatelessWidget {
  final String lottieURl;

  const mylotitie({Key? key, required this.lottieURl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: LottieBuilder.network(lottieURl),
      ),
    );
  }
}
