import 'package:flutter/material.dart';

import '../constant/constant.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? selected;

  @override
  void initState() {
    super.initState();
    selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    const _image = 'assets/img/music.jpg';
    return Scaffold(
      backgroundColor: kDefaultColor,
      body: Column(
        children: [
          const SizedBox(height: 55),
          const CircleAvatar(
            radius: 77,
            backgroundImage: AssetImage(_image),
          ),
          buildListView(context)
        ],
      ),
    );
  }

  Expanded buildListView(BuildContext context) {
    const String _title = 'sorry';
    const String _subtitle = 'Justin Bieber';
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 9,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, int index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: buildListTile(index, _title, _subtitle, context),
        ),
      ),
    );
  }

  ListTile buildListTile(
      int index, String _title, String _subtitle, BuildContext context) {
    return ListTile(
      selected: true,
      selectedTileColor: selected == index ? Colors.white : kDefaultColor,
      trailing: trailingIcon(index),
      leading: leadingIcon(index),
      title: Text(_title, style: buildTextStyle(index)),
      subtitle: Text(_subtitle, style: buildTextStyle(index)),
      onTap: () => setState(() => selected = index),
      onLongPress: () {
        Navigator.pushNamed(context, '/MusicPlay');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }

  Icon trailingIcon(int index) {
    return Icon(Icons.favorite_sharp,
        size: 30, color: selected == index ? Colors.grey : Colors.white);
  }

  Icon leadingIcon(int index) {
    return Icon(
      selected == index
          ? Icons.pause_circle_filled_sharp
          : Icons.play_circle_sharp,
      size: 30,
      color: selected == index ? kDefaultColor : Colors.white,
    );
  }

  TextStyle buildTextStyle(int index) {
    return TextStyle(color: selected == index ? kDefaultColor : Colors.white);
  }
}
