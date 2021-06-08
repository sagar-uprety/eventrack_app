import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://www.shutterstock.com/image-vector/white-map-city-curtiba-digital-art-1339788473',
      height: 400,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
