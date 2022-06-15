import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gosellgh/pages/product_details.dart';


class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "blezer",
      "picture": 'assets/images/printer.png',
      "old_price": 50,
      "price": 40
    },
    {
      "name": "Drown",
      "picture": 'assets/images/drown.png',
      "old_price": 1500,
      "price": 1400
    },
    {
      "name": "Jeans",
      "picture": 'assets/images/jeans.png',
      "old_price": 150,
      "price": 140
    },
    {
      "name": "dress",
      "picture": 'assets/images/computer.png',
      "old_price": 150,
      "price": 140
    },
    {
      "name": "Bike",
      "picture": 'assets/images/bicycle.png',
      "old_price": 150,
      "price": 140
    },
    {
      "name": "Cap",
      "picture": 'assets/images/cap.png',
      "old_price": 150,
      "price": 140
    },
    {
      "name": "Shirt",
      "picture": 'assets/images/menshirt.png',
      "old_price": 150,
      "price": 140
    },
    {
      "name": "Perfume",
      "picture": 'assets/images/perfume.png',
      "old_price": 150,
      "price": 140
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_oldprice: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldprice;
  final product_price;

  const Single_prod(
      {Key? key,
      this.product_name,
      this.product_picture,
      this.product_oldprice,
      this.product_price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: 10.0,
      shadowColor: Colors.red,
      child: Hero(
        tag: Text(product_name),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProductDetails(
                  product_detail_name:product_name ,
                  product_detail_oldprice: product_oldprice,
                  product_detail_picture: product_picture,
                  product_detail_price: product_price,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\$$product_price"),
                  subtitle: Text(
                    "\$$product_oldprice",
                    style: const TextStyle(
                        backgroundColor: Colors.black26,
                        fontSize: 15.0,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red),
                  ),
                ),
              ),
              child: Image.asset(
                product_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
