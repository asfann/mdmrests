import 'package:flutter/material.dart';
import 'package:mdmrest/config.dart';
class HeroTitle extends StatelessWidget {
  const HeroTitle({
    Key? key, @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2,child: Align(
      alignment: Alignment.bottomLeft,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,
              style: TextStyle(
                fontSize: Config.screenWidth! * 0.1,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: Config.screenHeight! * 0.005,
            ),
            Text(subtitle!, style: TextStyle(
              fontSize: Config.screenWidth!*0.045,

            ),
            ),
            SizedBox(
              height: Config.screenHeight! * 0.005,
            ),

          ],
        ),
      ),
    ),
    );
  }
}
