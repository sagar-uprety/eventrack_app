import 'dart:ui';
import 'Imagefile.dart';
import 'package:flutter/material.dart';
import './Location.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ImageContainer(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 310),
            child: Text("Description"),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ...",
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 310),
            child: Text(
              "Read more",
              style: TextStyle(color: Colors.purple),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // Location(),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 80,
              right: 80.0,
              top: 200.0,
            ),
            child: Container(
              width: 550.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 100.0, top: 20.0),
                child: Text("Submit"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
