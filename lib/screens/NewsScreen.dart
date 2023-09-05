import 'package:flutter/cupertino.dart';

import '../config/colors.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: bgColor,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: whiteColor,
        middle: Text("Лента",
            style: TextStyle(
                color: blackColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w100)),
      ),
      child: Container(),
    );
  }
}
