import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  @override
  Widget build(BuildContext context) {

    var product_list;
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index){
      return Single_cart_Product();
    });
  }
}

class Single_cart_Product extends StatelessWidget {
  final product_Dname;
  final product_Dpicture;
  final product_Dcolor;
  final product_DSize;
  final product_Dquantity;
  final product_Dprice;
  const Single_cart_Product({Key? key, this.product_Dname, this.product_Dpicture, this.product_Dcolor, this.product_DSize, this.product_Dquantity, this.product_Dprice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('ekekeke'),

      ),
    );
  }
}
