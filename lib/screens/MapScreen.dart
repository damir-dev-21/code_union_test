import 'package:flutter/cupertino.dart';

import '../config/colors.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: bgColor,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: whiteColor,
        middle: Text("Карта",
            style: TextStyle(
                color: blackColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w100)),
      ),
      child: Container(),
    );
  }
}
