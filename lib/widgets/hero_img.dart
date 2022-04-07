import 'package:flutter/material.dart';
import 'package:mdmrest/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HeroImg extends StatelessWidget {
  const HeroImg({
    Key? key,
    @required this.path,
    @required this.semanticsLabel,
  }) : super(key: key);

  final String? path, semanticsLabel;
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 4,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: Config.screenHeight! * 0.02),
            child: SvgPicture.asset(path!, semanticsLabel: semanticsLabel!)));
  }
}
