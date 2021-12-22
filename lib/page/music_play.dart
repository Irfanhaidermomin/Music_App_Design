import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constant/constant.dart';

class MusicPlay extends StatefulWidget {
  const MusicPlay({Key? key}) : super(key: key);

  @override
  State<MusicPlay> createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                buildContainer(size),
                buildPositioned(context),
                buildBackAndMenuIcon(size),
                buildText1(size),
                buildFavoriteAndCheckIcon(size),
                buildText2(size),
                buildAvatar(size),
                buildLinearPercentIndicator(size),
                buildBottomMenuIcon(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildBottomMenuIcon(Size size) {
    return Positioned(
      left: size.width * .1,
      bottom: 30,
      child: const Icon(menuIcon, size: 40, color: kDefaultColor),
    );
  }

  Positioned buildLinearPercentIndicator(Size size) {
    return Positioned(
      bottom: size.width * 0.25,
      left: size.width * 0.1,
      child: Column(
        children: [
          Row(
            children: [
              const Text('1:22'),
              SizedBox(width: size.width / 3),
              const Text('3:57'),
            ],
          ),
          LinearPercentIndicator(
            width: size.width / 2,
            lineHeight: 12.0,
            percent: 0.4,
            backgroundColor: Colors.white,
            progressColor: kDefaultColor,
          ),
        ],
      ),
    );
  }

  Positioned buildAvatar(Size size) {
    return Positioned(
      top: size.width / 2.5,
      left: size.width * .25,
      right: size.width * .25,
      child: const CircleAvatar(
        radius: 88,
        backgroundImage: AssetImage(image),
      ),
    );
  }

  Positioned buildText2(Size size) {
    const _title = 'Sorry';
    const _subTitle = 'Sorry';
    return Positioned(
      bottom: size.width * .68,
      left: size.width * .37,
      right: size.width * .3,
      child: Wrap(
        children: const [
          Text(_title, style: TextStyle(color: Colors.white, fontSize: 30)),
          Text(_subTitle, style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }

  Positioned buildFavoriteAndCheckIcon(Size size) {
    return Positioned(
      top: size.width * .58,
      left: size.width * .1,
      right: size.width * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildGeneralButton(45, 45, const Icon(favoriteIcon)),
          buildGeneralButton(45, 45, const Icon(checkIcon)),
        ],
      ),
    );
  }

  Positioned buildText1(Size size) {
    return Positioned(
      top: size.width * 0.3,
      right: size.width * 0.25,
      child: const Text(
        'NOW PLAYING',
        style: TextStyle(color: Color(0xFFB4B4B4), fontSize: 30),
      ),
    );
  }

  Positioned buildBackAndMenuIcon(Size size) {
    return Positioned(
      top: size.width * .1,
      left: size.width * .1,
      right: size.width * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildGeneralButton(45, 45, const Icon(backIosIcon)),
          buildGeneralButton(45, 45, const Icon(menuIcon)),
        ],
      ),
    );
  }

  Positioned buildPositioned(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      right: 0,
      bottom: size.height * .25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildGeneralButton(
              70, 70, Image.asset(leftImg, color: kDefaultColor, scale: 2)),
          buildGeneralButton(
              95, 95, Image.asset(pausaImg, color: kDefaultColor, scale: 2)),
          buildGeneralButton(
              70, 70, Image.asset(rightImg, color: kDefaultColor, scale: 2)),
        ],
      ),
    );
  }

  Container buildContainer(Size size) {
    return Container(
      height: size.height * .75 - 45,
      decoration: const BoxDecoration(
        color: kDefaultColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }

  Container buildGeneralButton(
    double height,
    double width,
    Widget icon,
  ) =>
      Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height),
            color: Colors.white,
          ),
          child:
              IconButton(onPressed: () {}, icon: icon, color: kDefaultColor));
}
