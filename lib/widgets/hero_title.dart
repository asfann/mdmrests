import 'package:flutter/material.dart';
import 'package:mdmrest/config.dart';
class HeroTitle extends StatelessWidget {
  const HeroTitle({
    Key? key, required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2,child: Align(
      alignment: Alignment.bottomLeft,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.1,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(subtitle, style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.045,

            ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),

          ],
        ),
      ),
    ),
    );
  }
}
