import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalSrollView extends StatelessWidget {
  const HorizontalSrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Categories(
            Image_Location: "assets/images/dresses.png",
            Image_caption: 'Dresses',
          ),
          Categories(
            Image_Location: "assets/images/sandas.png",
            Image_caption: 'Sandals',
          ),
          Categories(
            Image_Location: "assets/images/laptop.png",
            Image_caption: 'Laptop',
          ),
          Categories(
            Image_Location: "assets/images/t.png",
            Image_caption: 'TV',
          ),
          Categories(
            Image_Location: "assets/images/ladiesbag.png",
            Image_caption: 'Bags',
          ),
          Categories(
            Image_Location: "assets/images/menswear3.png",
            Image_caption: 'MenShirt',
          ),
          Categories(
            Image_Location: "assets/images/phonew.png",
            Image_caption: 'Phones',
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final String Image_Location;
  final String Image_caption;
  const Categories(
      {Key? key, required this.Image_Location, required this.Image_caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: SizedBox(
        height: 120.0,
        width: 100.0,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            title: Image.asset(Image_Location, height: 80.0, width: 100.0),
            subtitle: Text(
              Image_caption,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
