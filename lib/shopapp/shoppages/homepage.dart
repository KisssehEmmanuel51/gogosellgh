import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'components/crart_page.dart';
import 'components/horinzontal_scrow.dart';
import 'components/product_page.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPageView()));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
          ],
          title: Center(
              child: Text(
            'My Home',
            style: TextStyle(
              fontFamily: 'assets/fonts/Signatra.ttf',
              color: Colors.white,
            ),
          )),
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: DrawerHeader(
                    child: CircleAvatar(),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    curve: Curves.easeInCirc,
                    duration: Duration(seconds: 3)),
              ),
              Divider(
                height: 23.0,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const ListTile(
                        title: Text('HOME'),
                        leading: Icon(Icons.home, color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: ListTile(
                        title: Text('Account'),
                        leading: Icon(Icons.account_box, color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const ListTile(
                        title: Text('Order'),
                        leading: Icon(Icons.shopping_basket,
                            color: Colors.deepOrange),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const ListTile(
                        title: Text('Categories'),
                        leading:
                            Icon(Icons.category_outlined, color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const ListTile(
                        title: Text('Favourite'),
                        leading: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const ListTile(
                        title: Text('Setting'),
                        leading: Icon(
                          Icons.settings,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const ListTile(
                        title: Text('About us'),
                        leading:
                            Icon(Icons.wheelchair_pickup, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 200.0,
              child: Carousel(
                overlayShadowSize: 3.0,
                dotIncreasedColor: Colors.orange,
                autoplayDuration: const Duration(seconds: 60),
                borderRadius: true,
                animationCurve: Curves.bounceOut,
                //overlayShadowColors: Colors.orangeAccent,
                dotSize: 6.0,
                boxFit: BoxFit.fitHeight,
                images: [
                  AssetImage('assets/images/shoppingbag.png'),
                  AssetImage('assets/images/phonew.png'),
                  AssetImage('assets/images/canvas.png'),
                  AssetImage('assets/images/laptop.png'),
                  AssetImage('assets/images/ladiesbag.png'),
                  AssetImage('assets/images/menshirt.png'),
                  AssetImage('assets/images/nikeshoe.png'),
                  AssetImage('assets/images/phonew.png'),
                  AssetImage('assets/images/printer.png'),
                  AssetImage('assets/images/shop.png'),
                  AssetImage('assets/images/drown.png'),
                  AssetImage('assets/images/sandas.png'),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Categories",
                style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
              ),
            ),
            //horizontal scrow
            HorizontalSrollView(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recent   Products',
                  style: TextStyle(
                    color: Colors.pink,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Signatra",
                      fontSize: 20.0),
                ),
              ),
            ),
            Container(
              color: Colors.orange,
              height: 320.0,
              child: Products(),
            )
          ],
        ));
  }
}
