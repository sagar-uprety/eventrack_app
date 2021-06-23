import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBar(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =
        MediaQuery.of(context).size; //This gives total height of our device
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: Container(
        width: size.width * 0.90,
        height: size.height * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
