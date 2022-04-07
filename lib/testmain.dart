import 'package:flutter/material.dart';



class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: buildList(context),
      ),
    );
  }

  List<ListTile> buildList(BuildContext context) {
    return data
        .map((HoursData f) => ListTile(
      title: Text(f.name),
      subtitle: Text('Category: ${f.catergory}'),
      leading: Icon(f.iconData),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            if (f.favorite) {
              favoriteData.remove(f);
              f.favorite = false;

              // Результат favoriteData
              print('-----------');
              favoriteData.forEach((element) => print(element.name));
              print('-----------');
            } else {
              favoriteData.add(f);
              f.favorite = true;

              // Результат favoriteData
              print('-----------');
              favoriteData.forEach((element) => print(element.name));
              print('-----------');
            }
          });
        },
        child: Container(
          child: Icon(
            Icons.favorite_border,
            color: (f.favorite) ? Colors.red : Colors.grey,
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(f.rt),
    ))
        .toList();
  }
}

class HoursData {
  String name;
  String catergory;
  IconData iconData;
  String rt;
  bool favorite;

  HoursData({required this.name, required this.catergory, required this.iconData, required this.rt, required this.favorite});
}

List<HoursData> data = [
  HoursData(
    name: 'Programming',
    catergory: 'Technology',
    iconData: Icons.computer,
    rt: '/favorite',
    favorite: false,
  ),
  HoursData(
    name: 'Run',
    catergory: 'Sport',
    iconData: Icons.directions_run,
    rt: '/favorite',
    favorite: false,
  ),
  HoursData(
    name: 'Bike',
    catergory: 'Sport',
    iconData: Icons.directions_bike,
    rt: '/favorite',
    favorite: false,
  ),
];

List<HoursData> favoriteData =  <HoursData>[];