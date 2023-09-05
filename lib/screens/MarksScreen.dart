import 'package:code_union_test/config/colors.dart';
import 'package:flutter/cupertino.dart';

class MarksScreen extends StatefulWidget {
  MarksScreen({Key? key}) : super(key: key);

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: bgColor,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: whiteColor,
        middle: Text("Избранное",
            style: TextStyle(
                color: blackColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w100)),
      ),
      child: Container(),
    );
  }
}
